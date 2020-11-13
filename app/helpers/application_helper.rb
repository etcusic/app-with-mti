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
        params[:controller] == "users" && params[:action] == "show" && params[:id] == current_user.id
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

    # LINKS
    def link_to_home
        link_to "Home Page", '/'
    end

    def link_to_new_profile
        link_to "Create Profile!", new_user_path
    end

    def link_to_login
        link_to "Log In", '/login'
    end

    def link_to_logout
        link_to "Log Out", '/logout', method: 'post'
    end

    def link_to_profile
        link_to "Profile", user_path(current_user)
    end

    def link_to_omni
        link_to 'Log in with Facebook', '/auth/facebook'
    end

    def link_to_highest_tutor
        link_to "Highest Rated Tutor!", '/tutors/highest_rated'
    end

    def link_to_new_appt
        link_to "Create Appointment!", "/users/#{current_user.id}/appointments/new", method: 'get'
    end

    def link_to_edit_profile
        link_to "Edit Profile", edit_user_path(current_user)
    end

    def link_to_all_tutors
        link_to "Meet the Tutors", tutors_path
    end

end
