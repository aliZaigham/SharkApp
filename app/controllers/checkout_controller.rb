class CheckoutController < ApplicationController
    def create
        cartitems = Cart.where("user_id=?",current_user.id)

        array = []

        cartitems.each do |item| 
            hash = {
                price_data: {
                  unit_amount: ((item.subitem.price).to_i) * 10,
                  currency: "pkr",
                  product_data: {
                    name: item.subitem.title,
                  },
                },
                quantity: item.quantity
              }
              array << hash
        end  


        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: array,
            mode: 'payment',
            success_url: cart_url,
            cancel_url: cart_url,
          })
          respond_to do |format|
            format.html
          end

    end
end