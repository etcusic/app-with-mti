class TutorsController < UsersController
    skip_before_action :require_login, only: [:index, :highly_rated]
    skip_before_action :validate_user, only: [:index, :highly_rated, :search]

    def index
        @tutors = Tutor.ranked_tutors
    end

    def highly_rated
        @tutors = Tutor.highly_rated.ranked_tutors
        render :index
    end

    private

    def user_params
        params.require(:tutor).permit(
            :id, :type, :image, :email, :first_name, :last_name, :password, :password_confirmation,
            :resume, :zoom_link, :puppets, :rating
        )
    end

    def new_user
        user = Tutor.new
    end

end