class SessionsController < ApplicationController
    skip_before_action :require_login

    def new
    end

    #what the fuck is going on with my login???
    def create
        # binding.pry
        @user = User.find_by(email: session_params[:email])
        if @user && @user.authenticate(session_params[:password])
            # binding.pry
            session[:id] = @user.id
            redirect_to @user
            # redirect_to user_path(@user)
        else
            redirect_to 'application#home'
        end
    end

    def create_with_omniauth
        # find by ID => if no id found, redirect to sign up page
        name = auth['info']['name'].split(" ")
        # binding.pry
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.first_name = name[0]
            u.last_name = name[1]
            u.email = auth['info']['email']
            u.image = auth['info']['image']
        end
       
          session[:user_id] = @user.id
    #    binding.pry
          redirect_to @user
    end

    def destroy
        session.delete :name
    end

    private

    def session_params
        params.require(:user).permit(:email, :password)
    end

    def auth
        request.env['omniauth.auth']
    end
    
end