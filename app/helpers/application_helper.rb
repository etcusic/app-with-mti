module ApplicationHelper

    def current_user
        @user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        session[:user_id]
    end

    def users_stuff?
        session[:user_id] == params[:id].to_i 
    end

    def is_student?
        current_user.is_student?
    end

    def is_tutor?
        current_user.is_tutor?
    end

    def display_errors(msg)
        "#{msg[0].to_s.capitalize}: #{msg[1][0]}"
    end

    def permitted_params
        params.require().permit
    end

    # URL IDENTIFIERS
    def user_profile?
        params[:controller] == "users" && params[:action] == "show" && params[:id] == current_user.id.to_s
    end

    def edit_profile?
        params[:controller] == "users" && params[:action] == "edit"
    end

    def new_appt?
        params[:controller] == "appointments" && params[:action] == "new"
    end

    def tutors_index?
        params[:controller] == "tutor" && params[:action] == "index"
    end

    def highest_tutor?
        params[:controller] != "tutor" && params[:action] != "index"
    end

end