module UserHelper
    def user_is_admin
        current_user && current_user.admin
    end
    def user_is_seller
        current_user && current_user.seller
    end  
    def user_is_buyer
        current_user && current_user.buyer
    end 
    def user_is_owner
       current_user && current_user.id == @product.user_id
    end   
end
