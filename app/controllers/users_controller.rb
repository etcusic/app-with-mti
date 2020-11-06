class UsersController < ApplicationController
    before_action :user, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        
    end

    def show
        # binding.pry
        params.permit(:id)
        if params[:id].to_i == @user.id
            user_path(@user)
        else
            # add error message?
            flash[:error] = "You're not Ron."
            redirect_to "/" 
        end
    end

    def edit
        # validate user request
        if current_user.is_tutor?
            edit_tutor_path(current_user)
        elsif current_user.is_student?
            edit_student_path(current_user)
        else
            #should not be an else, but....
            redirect_to '/'
        end
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
            :id, :type, :first_name, :last_name, :password, :image, 
            :resume, :zoom_link, :puppets, :rating,
            :about_me, :level, :helicopter_parent, :gold_stars
        )
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