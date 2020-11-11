class UsersController < ApplicationController
    before_action :user, only: [:show, :edit, :update, :destroy]
    # skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save   
            session[:user_id] = @user.id
            @user.update(type: user_params[:category])
            redirect_to edit_user_path(@user)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def destroy
        # warning/alert message
        current_user.destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(
            :id, :category, :type, :image, :email, :first_name, :last_name, :password, :password_confirmation,
            :resume, :zoom_link, :puppets, :rating,
            :about_me, :level, :helicopter_parent, :gold_stars
        )
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