class StudentsController < UsersController
    skip_before_action :validate_user, only: [:index]

    def index
        @students = Student.gold_stars
    end

    private

    def user_params
        params.require(:student).permit(
            :id, :type, :image, :email, :first_name, :last_name, :password, :password_confirmation,
            :about_me, :level, :gold_stars, :helicopter_parent
        )
    end

    def new_user
        user = Student.new
    end

end