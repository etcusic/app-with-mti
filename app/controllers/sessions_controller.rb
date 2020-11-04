class SessionsController < ApplicationController
    skip_before_action :require_login

    def new
    end

    #what the fuck is going on with my login???
    def create
        # binding.pry
        @user = User.find_by(email: session_params[:email])
        if @user && @user.authenticate(session_params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/'
        end
    end

    def create_with_omniauth
        name = auth['info']['name'].split(" ")
        @user = User.find_or_create_by(email: auth['info']['email']) do |u|
            u.first_name = name[0]
            u.last_name = name[1]
            u.password = "password" # refactor this to something random
            u.image = auth['info']['image']
            u.uid = auth['uid']
        end
          session[:user_id] = @user.id
          redirect_to @user
    end

    def destroy
        binding.pry
        session.delete(:user_id)
        redirect_to '/'
    end

    private

    def session_params
        params.require(:user).permit(:email, :password)
    end

    def auth
        request.env['omniauth.auth']
    end

    def collect_errors

    end
    
end