module UsersHelper

    def item_count
        count = 0
        if user_signed_in?
            count = @cartitems = Cart.where("user_id=?",current_user.id).count
        else
            count = 0
        end
        count
    end

end
