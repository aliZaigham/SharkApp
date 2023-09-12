class AdminController < ApplicationController



    def subitem_admin

        @subitems = Subitem.all
        
    end

    def item_admin
        @items = Item.all
    end

    def adminDashboard
    end
    def adminOrder
        @order = Order.all
    end
end
