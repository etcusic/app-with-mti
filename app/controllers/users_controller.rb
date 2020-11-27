class UsersController < ApplicationController
    before_action :user, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:new, :create]
    skip_before_action :validate_user, only: [:new, :create, :show]

    def new
        @user = new_user
    end

    def create
        @user = User.new(user_params)
        if @user.save   
            session[:user_id] = @user.id
            redirect_to @user.url
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to @user.url
        else 
            render :edit
        end
    end

    def destroy
        current_user.destroy
        session.delete(:user_id)
        redirect_to '/'
    end

end

