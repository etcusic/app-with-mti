module UsersHelper

   def public_profile
        params.permit(:id)
        @public_user = User.find_by_id(params[:id])
   end
    
end