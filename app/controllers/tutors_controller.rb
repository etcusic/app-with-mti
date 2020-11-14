class TutorsController < ApplicationController
    before_action :user, only: [:edit, :update]
    skip_before_action :require_login, only: [:index, :highly_rated]
    skip_before_action :validate_user, only: [:index, :highly_rated]

    def index
        @tutors = Tutor.ranked_tutors
    end

    def edit
    end

    def update
        if @user.update(tutor_params) 
            redirect_to user_url 
        else 
            render :edit
        end
    end

    def highly_rated
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