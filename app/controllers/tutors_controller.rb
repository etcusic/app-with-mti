class TutorsController < ApplicationController
    before_action :tutor, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:new, :create, :highest_rated]

    def index
        @tutors = Tutor.ranked_tutors
    end

    def new
        @tutor = Tutor.new
    end

    def create
        @tutor = Tutor.new(user_params)
        if @tutor.save   
            session[:user_id] = @tutor.id
            redirect_to tutor_path(@tutor)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def highest_rated
        # is there a better way to scope this route?
        @tutor = Tutor.order(rating: :desc).first
        redirect_to "/users/#{@tutor.id}"
    end

    def update
        # validate user?
        if @tutor.update(tutor_params) 
            redirect_to "tutors#show" 
        else 
            render :edit
        end
    end

    def destroy
        # warning/alert message
        current_user.destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    private 

    def tutor
        @tutor = Tutor.find_by_id(session[:user_id])
    end

    def tutor_params
        params.require('tutor').permit(
            :id, :image, :email, :first_name, :last_name, :password, :password_confirmation,
            :resume, :zoom_link, :puppets, :rating
        )
    end

end