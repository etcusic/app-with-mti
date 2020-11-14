class StudentsController < ApplicationController
    before_action :user, only: [:edit, :update]
    skip_before_action :require_login, only: [:index]
    skip_before_action :validate_user, only: [:index]

    def index
        @students = Student.gold_stars
    end

    def edit
    end

    def update
        if @user.update(student_params)
            redirect_to user_url 
        else 
            render :edit
        end
    end

    private

    def student_params
        params.require('student').permit(
            :id, :category, :image, :email, :first_name, :last_name, :password, :password_confirmation, 
            :about_me, :level, :helicopter_parent
        )
    end
    
end