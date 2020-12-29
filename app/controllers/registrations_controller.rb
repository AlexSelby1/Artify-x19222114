class RegistrationsController < Devise::RegistrationsController

 private

 def sign_up_params
  params.require(:user).permit(:username, :email, :password, :password_confirmation, :seller, :userImage)
 end
 
 def sign_in_params
  params.require(:user).permit(:email, :current_password, :userImage)
 end
 
 def account_update_params
  params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, :seller, :userImage)
 end

end