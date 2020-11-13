class TutorsController < ApplicationController
    before_action :user, only: [:edit, :update]
    skip_before_action :require_login, only: [:index, :highly_rated]

    def index
        @tutors = Tutor.ranked_tutors
    end

    def edit
    end

    def update
        # validate user?
        if @user.update(tutor_params) 
            redirect_to "/users/#{@user.id}" 
        else 
            render :edit
        end
    end

    def highly_rated
        # use highly rated
        # is there a better way to scope this route?
        @tutors = Tutor.highly_rated
    end

    private 

    def tutor_params
        params.require('tutor').permit(
            :id, :category, :image, :email, :first_name, :last_name, :password, :password_confirmation,
            :resume, :zoom_link, :puppets
        )
    end

end