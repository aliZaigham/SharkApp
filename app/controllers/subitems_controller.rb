class SubitemsController < ApplicationController

    before_action :authenticate_user!


    def index
         item_id = params[:format].to_i
        @subitems = Subitem.where("item_id = ? ",item_id)
    end

    def new 
        @item = Item.all
        @subitem = Subitem.new
    end

    def show
        @subitem = SubIitem.find(params[:id])
    end
   
    def destroy
        
        @subitem = Subitem.find(params[:id])
        @subitem.destroy
    
        redirect_to subitem_path, notice: 'Item was successfully deleted.'
    end

    def create

        @subitem = Subitem.new
        @subitem.title = params[:subitem]["title"]
        @subitem.description = params[:subitem]["description"]
        @subitem.price = params[:subitem]["price"].to_i
        @subitem.item_id = params[:item_id]

        if @subitem.save
            redirect_to subitem_path
        else
            render :new
        end        
                
    end

    private

    def item_params
        params.permit(:name, :description, :price, :item_id)
    end

end
