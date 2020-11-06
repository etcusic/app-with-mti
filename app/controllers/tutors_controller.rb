class TutorsController < ApplicationController
    before_action :tutor, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:new, :create]

    def index
        @tutors = Tutor.ranked_tutors
    end

    def new
        @tutor = Tutor.new
    end

    def create
        @tutor = Tutor.new(tutor_params)
        if @tutor.save   
            session[:user_id] = @tutor.id
            redirect_to "/users/#{@tutor.id}"
        else
            # error page
            # binding.pry
            new_tutor_path
        end
    end

    def show
        # check for if current_user
    end

    def edit
        # validate user request
    end

    def update
        # binding.pry
        #validate user first
        #validate update info => current_user.errors
        if @tutor.update(tutor_params)
            tutor_path(@tutor)
        else 
            edit_tutor_path(@tutor)
        end
    end

    def destroy
        # warning/alert message
        binding.pry
        current_user.appointments.destroy_all
        current_user.destroy
        redirect_to 'sessions#destroy'
    end

    private

    def tutor
        @tutor = Tutor.find_by_id(session[:user_id])
    end

    def tutor_params
        params.require(:tutor).permit(:id, :first_name, :last_name, :email, :password, :resume, :rating, :zoom_link, :puppets, :image)
    end

end