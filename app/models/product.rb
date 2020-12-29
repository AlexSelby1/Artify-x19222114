class Product < ApplicationRecord

    
    mount_uploader :image, ImageUploader

    belongs_to :user, optional: true, foreign_key: :user_id
 
    validates :title, :description, :price, presence: true
    
    validates_processing_of :image
    validate :image_size_validation
   
private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
end
