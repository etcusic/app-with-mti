class StudentsController < ApplicationController

    def edit
        # validate user request
        current_user
    end

    def update
        #validate user first
        #validate update info => current_user.errors
        current_user.update_student(student_params)
    end

    private

    def student_params
        params.require(:user).permit(:id, :first_name, :last_name, :password, :about_me, :level, :gold_stars, :helicopter_parent, :image)
    end

    
end