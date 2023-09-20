class CheckoutController < ApplicationController
    def create

        cartitems = Cart.where("user_id=?",current_user.id)

        array = []

        cartitems.each do |item| 
            hash = {
                price_data: {
                  unit_amount: ((item.subitem.price).to_i) * 100,
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
            success_url: succes_url,
            cancel_url: fail_url,
          })


        session[:address] = params[:address]
        session[:phone] = params[:phone_number]        

          respond_to do |format|
            format.html
          end

    end

    def succes
      @cartitems = Cart.where("user_id = ?", current_user.id)
      
      @cartitems.each do |item|
        @orders = Order.new
        @orders.user_id = item.user_id
        @orders.address = session[:address]
        @orders.phone_number = session[:phone]
        @orders.subitem_id = item.subitem_id
        @orders.quantity = item.quantity
        @orders.save
      end
      @cartitems.destroy_all
      session.delete(:address)
      session.delete(:phone)
      @orders = Order.where("user_id = ?", current_user.id)
      

    end
    

    def fail
    end

    def aboutus
    end
    
    def contact
    end
end