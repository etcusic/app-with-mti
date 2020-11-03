class SessionsController < ApplicationController
    skip_before_action :require_login

    def new
    end

    def create
        # need to check multiple tables for ID
        # user = User.find_by(email: session_params[:email])
        if user && user.authenticate(session_params[:password])
            session[:id] = user.id
            redirect_to 'application#home'
        else
            redirect_to '/login'
        end
    end

    def destroy
        session.delete :name
    end

    private

    def session_params
        params.require(:session).permit(:email, :password)
    end
    
end