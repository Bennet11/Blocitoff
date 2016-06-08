class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @items = @user.items.build(items_params)

    if @items.save
      flash[:notice] = "To-Do item successfully saved."
    else
      flash[:error] = "Error saving To-Do item."
    end
    redirect_to @user
  end


  private

  def items_params
    params.require(:item).permit(:name)
  end
end
