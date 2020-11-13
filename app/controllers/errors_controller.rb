class ErrorsController < ApplicationController
    skip_before_action :require_login
    skip_before_action :validate_user

    def nacho_stuff
    end

end