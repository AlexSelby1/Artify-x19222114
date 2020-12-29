class Order < ApplicationRecord
  
  def order_params
params.require(:order).permit( :order_date, :user_id, :status)
  end
  
     belongs_to :user
     has_many:orderitems   
end
