class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
    mount_uploader :userImage, ImageUploader
         
    validates_processing_of :userImage
    validate :image_size_validation
   
 # Need to validate more
private
  def image_size_validation
    errors[:userImage] << "should be less than 500KB" if userImage.size > 0.5.megabytes
  end
    
 validates_uniqueness_of :username
   validates_inclusion_of :seller, :in => [true, false]
   
      def user_params
 params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :userImage)
      end
   
         has_many :products
         has_many :orders

end
