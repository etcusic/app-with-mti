class TutorsController < ApplicationController
    before_action :tutor, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:new, :create]

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
            redirect_to new_tutor_path
        end
    end

    def show

    end

    def edit
        # validate user request
        current_user
    end

    def update
        binding.pry
        #validate user first
        #validate update info => current_user.errors
        current_user.update_tutor(tutor_params)
    end

    private

    def tutor
        @tutor = Tutor.find_by_id(session[:user_id])
    end

    def tutor_params
        params.require(:tutor).permit(:id, :first_name, :last_name, :email, :password, :resume, :rating, :zoom_link, :puppets, :image)
    end

end