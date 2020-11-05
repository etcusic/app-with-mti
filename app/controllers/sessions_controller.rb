class SessionsController < ApplicationController
    skip_before_action :require_login

    def new
    end

    def create
        @user = User.find_by(email: session_params[:email])
        if @user && @user.authenticate(session_params[:password])
            initialize_session
            redirect_to user_path(@user)
        else
            # check for errors and redirect to errors page
            redirect_to '/login'
        end
    end

    def create_with_omniauth
        @user = User.find_by(uid: auth['uid'])
        if @user
            initialize_session
            redirect_to @user
        else
            name = auth['info']['name'].split(" ")
            @user = User.create(
                uid: auth['uid'],
                email: auth['info']['email'],
                first_name: name[0],
                last_name: name[1],
                image: auth['info']['image'],
                password: "password" # refactor this to something random                
            )
            if @user.errors.any?
                #create errors page
                #refactor this into a helper method?
                redirect_to '/'
            else
                # new user must choose student or tutor (maybe don't use create until new user finishes editing process)
                # flash message? => update password
                initialize_session
                redirect_to edit_user_path
            end
        end
        
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    private

    def session_params
        params.require(:user).permit(:email, :password)
    end

    def initialize_session
        session[:user_id] = @user.id
    end

    def auth
        request.env['omniauth.auth']
    end
    
end

# SessionsController to do list:
#     - Errors for #create
#     - Errors for #create_with_omniauth
#     - #errors? helper method => @user.errors.any? ? redirect_to '/errors' : redirect_to @user
#     - set password to random in create_with_omniauth
#     - Omniauth user set up => student or tutor
#     - revisit require_login in ApplicationController
#     - #destroy action => are you sure? message (alert?)