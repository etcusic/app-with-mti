class StudentsController < ApplicationController
    before_action :user, only: [:update]
    # skip_before_action :require_login, only: [:new, :create]

    def index
        @students = Student.gold_stars
    end

    # currently looking for update method. Arg
    def update
        # binding.pry
        # validate user ?
        if @user.update(student_params)
            redirect_to "/users/#{@user.id}" 
        else 
            render :edit
        end
    end

    private

    def student_params
        params.require('student').permit(
            :id, :type, :email, :first_name, :last_name, :password, :image, 
            :about_me, :level, :helicopter_parent, :gold_stars
        )
    end
    
end