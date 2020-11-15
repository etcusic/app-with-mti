class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :warning
    before_action :require_login, except: [:home]
    before_action :validate_user, except: [:home]
    helper_method :current_user, :logged_in?, :users_stuff?, :user_url

    def home
    end

    private

    def user
        @user = User.find_by_id(session[:user_id])
    end

    def current_user
        @user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        session[:user_id]
    end
    
    def users_stuff?
        session[:user_id] == params[:id].to_i || session[:user_id] == params[:user_id].to_i
    end

    def require_login
        if !session[:user_id]
            redirect_to "/login"
        end
    end

    def validate_user
        if !users_stuff?
            redirect_to "/nacho_stuff"
        end
    end

    def user_url
        "/users/#{current_user.id}"
    end

end

