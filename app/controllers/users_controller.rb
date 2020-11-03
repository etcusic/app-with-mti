class UsersController < ApplicationController
    before_action :user, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:new, :create]

    def new
    end

    def create
    end

    def show
        # if user.class == Tutor
        #     redirect_to "tutors#show"
        # else 
        #     redirect_to "students#show"
        # end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :password)
    end

end