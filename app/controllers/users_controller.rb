class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authorize_admin, only: :index

# private
    # Use callbacks to share common setup or constraints between actions.
def login
  session[:login] = 1
  session[:cart] = nil
  redirect_to root
end
def logout
  session[:login] = nil
  session[:cart] = nil
  redirect_to root
end

def show
@user = User.find(params[:id])
end
def index 
  @users = User.all 
end
# Never trust parameters from the scary internet, only allow the white list through.
def user_params
  params.require(:user).permit(:id, :username, :email, :username, :password, :password_confirmation, :remember_me, :seller, :userImage)
end
def authorize_admin
    redirect_to root_path, status: 401 unless current_user.admin
    #redirects to previous page
end
end
