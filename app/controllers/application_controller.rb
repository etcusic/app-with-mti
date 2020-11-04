class ApplicationController < ActionController::Base
    before_action :require_login, except: [:home]
    include ApplicationHelper # pulls methods from ApplicationHelper (current_user) - should I not include entire module?

    def home
    end

    # what is the best way to work in #current_user 
    # right now it is in ApplicationHelper module, and that module is included in ApplicationController, which all other controllers inherit from

    def require_login
        # (if !helpers.current_user) => alternative to include ApplicationHelper at top of AppController
        if !session[:user_id]
            # create error to go along with it
            redirect_to "/login"
        end
    end

    #valid_request? method for users to see what they're allowed to - here or users controller? I think here

end
