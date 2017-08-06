class ItemsController < ApplicationController
  def create
    @item = current_user.items.new(item_params)

    if @item.save
      flash[:notice] = "To-do item was saved."
    else
      flash[:alert] = "There was an error saving the to-do item. Please try again."
    end
    redirect_to current_user
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" was successfully removed from to-do list."
    else
      flash[:alert] = "There was an error removing this item from your to-do list."
    end
    redirect_to current_user
  end

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
