class CartController < ApplicationController
  before_action :authenticate_user!
  def show
    @cartitems = Cart.where("user_id=?",current_user.id)
  end

  def add
   
    @subitem = Subitem.find_by(id: params[:id])
    quantity = params[:quantity].to_i
  
    # Find the existing cart or create a new one
    @cart = Cart.new
  
    if quantity > 0

      @cart.quantity = quantity
      @cart.user_id = current_user.id
      @cart.subitem_id = @subitem.id
      @cart.save
      flash[:notice] = "Cart updated successfully."

    elsif quantity <= 0

      @cart.destroy if @cart.persisted?
      flash[:notice] = "Please enter valid value to enter into cart."

    else

      flash[:error] = "Invalid quantity."
      
    end
  end
  

    def remove
      cart_item = Cart.find(params[:item_id].to_i)
      cart_item.destroy
      redirect_to cart_path, notice: 'Item removed from the cart.'
    end

    def update

      cart_item = Cart.find(params[:id])
      cart_item.quantity = params[:quantity].to_i

      if cart_item.save
        redirect_to cart_path, notice: 'Cart item updated successfully.'
      else
        puts "Errors: #{cart_item.errors.full_messages}" 
        render :edit
      end
    end

end
