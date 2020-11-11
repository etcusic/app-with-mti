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
        redirect_to "/users/#{@tutor.id}"
    end

    def create
        binding.pry
        @user = User.new(user_params)
        if @user.save   
            session[:user_id] = @user.id
            redirect_to edit_user_path(@user)
        else
            render :new
        end
    end

    def update
        # validate user?
        if @user.update(tutor_params) 
            redirect_to "users#show" 
        else 
            render :edit
        end
    end

    private 

    def tutor_params
        params.require('tutor').permit(
            :id, :type, :image, :email, :first_name, :last_name, :password, :password_confirmation,
            :resume, :zoom_link, :puppets, :rating
        )
    end

end