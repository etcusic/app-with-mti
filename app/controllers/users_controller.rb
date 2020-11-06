class UsersController < ApplicationController
    before_action :user, only: [:show, :edit, :update, :destroy]
    # skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if !confirm_password
            flash[:error] = "Invalid password/confirmation. Please try again."
        elsif @user.save   
            session[:user_id] = @user.id
            # binding.pry
            redirect_to edit_user_path(@user)
        else
            render :new
        end
    end

    def show
        # binding.pry
        params.permit(:id)
        if params[:id].to_i == @user.id
            user_path(@user)
        else
            # add error message?
            flash[:error] = current_user.no
            flash[:warning] = current_user.kill
            redirect_to "/" 
        end
    end

    def edit
        
    end

    # def update
        #currently being handled in tutors & students => will need to eliminate this route if that stays
        #validate user 
        # nest hash - basic user info & tutor/student info??

        # if current_user.is_tutor?
        #     current_user.update_tutor(tutor_params)
        # elsif current_user.is_student?
        #     current_user.update_student(student_params)
        # end
    # end

    def destroy
        # warning/alert message
        binding.pry
        current_user.appointments.destroy_all
        current_user.destroy
        redirect_to 'sessions#destroy'
    end

    private

    def user
        @user = User.find_by_id(session[:user_id])
    end

    def user_params
        params.require(:user).permit(
            :id, :type, :email, :first_name, :last_name, :password, :image, 
            :resume, :zoom_link, :puppets, :rating,
            :about_me, :level, :helicopter_parent, :gold_stars
        )
    end

    def confirm_password
        params.require(:user).permit(:password, :confirm_password)
        params[:password] == params[:confirm_password]
    end

    def redirect_according_to_type
        if @user.type == Tutor
            new_tutor_path
        elsif @user.type == Student
            new_student_path
        end
    end

    # def tutor_params
    #     params.require(:tutor).permit(:resume, :zoom_link, :puppets)
    # end

    # def student_params
    #     params.require(:student).permit(:about_me, :level, :helicopter_parent)
    # end

end

# UsersController to do list:
#     - add error messages to User/Tutor/Student models?
#     - create a before_action #valid_request? to check for users accessing what they're allowed (show, edit, update, destroy) - does this go in ApplicationController?
#     - errors for invalid input in #create action
#     - errors for invalid #update
#     - warning for #destroy

# TutorsAndStudentsController
#     - #update => divide into basic user info hash and tutor/student hash
#     - refactor tutor_params and student_params according to what works
#     - revisit routes to trim down what is necessary