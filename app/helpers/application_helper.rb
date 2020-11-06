module ApplicationHelper

    def current_user
        @user ||= User.find_by_id(session[:user_id])
    end

    def display_errors(msg)
        "#{msg[0].to_s.capitalize}: #{msg[1][0]}"
    end

end
