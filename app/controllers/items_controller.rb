class ItemsController < ApplicationController
  def index
    @items = current_user.items
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = "To-do item was saved."
      redirect_to items_path
    else
      flash.now[:alert] = "There was an error saving the to-do item. Please try again."
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
