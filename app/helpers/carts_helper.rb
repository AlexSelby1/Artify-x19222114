module CartsHelper
    def cart_is_empty
         @cart.line_items.count <= 0 
    end
end
