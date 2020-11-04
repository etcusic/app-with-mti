class TutorsController < ApplicationController
    before_action :tutor, only: [:show, :edit, :update, :destroy]

    def show
        binding.pry
        # TUTORS CONTROLLER
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def tutor
        @user = User.find_by_id(params[:id])
    end

    def tutor_params
        params.require(:user).permit(:first_name, :last_name, :password, :resume, :rating, :zoom_link, :puppets, :image)
    end

end