module ProductsHelper
    def product_user(product)
        user_signed_in? && current_user.id == product.user_ID
    end
end