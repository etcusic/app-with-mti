class TutorsController < ApplicationController
    before_action :user, only: [:update]
    # before_action :tutor, only: [:show, :edit, :update, :destroy]
    # skip_before_action :require_login, only: [:new, :create, :highest_rated]

    def index
        @tutors = Tutor.ranked_tutors
    end

    def highest_rated
        # is there a better way to scope this route?
        @tutor = Tutor.order(rating: :desc).first
        render :show
    end

    def update
        # binding.pry
        # validate user?
        if @user.update(tutor_params) 
            redirect_to "users#show" 
        else 
            render :edit
        end
    end

    private 

    def student_params
        params.require('student').permit(
            :id, :type, :email, :first_name, :last_name, :password, :image, 
            :resume, :zoom_link, :puppets, :rating
        )
    end

end