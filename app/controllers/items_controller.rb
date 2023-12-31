class ItemsController < ApplicationController



    def index
        @items = Item.all   
    end

    def new 
       @item = Item.new
    end

    def edit
      
        @item = Item.find(params[:id])

    end

    def show
        @item =Item.find(params[:id])
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
    
        redirect_to items_path, notice: 'Item was successfully deleted.'
    end
    
    
    def create
        
        @item = Item.new(item_params)
        if @item.save
            redirect_to items_path
        else
            render :new
        end        
    end
    def update
        @item = Item.find(params[:id])
      
        if @item.update(item_params)
          redirect_to items_path
        else
          render :edit
        end
      end
      

    
    
    private

    def item_params
        params.require(:item).permit(:name, :description, :price, :image)
    end
end
