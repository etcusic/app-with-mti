class UsersController < ApplicationController
    before_action :user, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        # incorporate errors for invalid input
        @user = User.new(user_params)
        if @user.save
            # redirect_to "show_user_path"
            if @user.class == Tutor
                redirect_to show_tutor_path(@user)
            elsif @user.class == Student
                redirect_to show_student_path(@user)
            else
                redirect_to "/"
            end
        end
    end

    def show
        binding.pry
        params.permit(:id)
        if params[:id].to_i == @user.id
            if @user.is_tutor?
                user_path(@user)
            elsif user.is_student?
                user_path(@user)
            else
                #error - wtf?
            end
        else
            # add error message?
            redirect_to "/"
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def user
        @user = User.find_by_id(session[:user_id])
    end

    def user_params
        params.require(:user).permit(:id, :first_name, :last_name, :password)
    end

end

UsersController to do list:
    - create a before_action #valid_request? to check for users accessing what they're allowed - does this go in ApplicationController?
    - errors for invalid input in #create action
    - 