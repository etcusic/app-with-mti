class TutorsController < ApplicationController

    def edit
        # validate user request
        current_user
    end

    def update
        #validate user first
        #validate update info => current_user.errors
        current_user.update_tutor(tutor_params)
    end

    private

    def tutor_params
        params.require(:user).permit(:first_name, :last_name, :password, :resume, :rating, :zoom_link, :puppets, :image)
    end

end