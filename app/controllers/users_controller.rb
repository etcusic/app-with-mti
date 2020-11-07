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
            redirect_to edit_user_path(@user)
        else
            render :new
        end
    end

    def show
        params.permit(:id)
        if params[:id].to_i == current_user.id
            user_path(@user)
        else
            # should show different profile info (no appts)
            redirect_to "/" 
        end
    end

    def edit
    end

    def update
        # validate user 
        if @user.update(tutor_params)
            render :show
        else 
            render :edit
        end
    end

    def destroy
        # warning/alert message
        current_user.appointments.destroy_all
        current_user.destroy
        session.delete(:user_id)
        redirect_to '/'
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