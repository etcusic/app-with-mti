class StudentsController < ApplicationController
    before_action :student, only: [:show, :edit, :update, :destroy]

    def show
        binding.pry
        # STUDENTS CONTROLLER
    end

    def edit
    end

    def update
    end

    private

    def student
        @student = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:id, :first_name, :last_name, :password, :about_me, :level, :gold_stars, :helicopter_parent, :image)
    end

    
end