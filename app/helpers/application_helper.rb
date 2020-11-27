module ApplicationHelper

    def public_profile
        params.permit(:id, :user_id)
        if params[:user_id]
            @public_user = User.find_by_id(params[:user_id])
        else
            @public_user = User.find_by_id(params[:id])
        end
    end

    def display_errors(msg)
        "#{msg[0].to_s.capitalize}: #{msg[1][0]}"
    end

    def delete_profile
        link_to "Delete Profile", current_user.url, method: 'delete', data: { confirm: "Are you sure you want to delete your profile?" }
    end

end