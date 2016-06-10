class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @items = @user.items.build(items_params)

    if @items.save
      flash[:notice] = "To-Do item successfully saved."
      redirect_to @user
    else
      flash[:error] = "Error saving To-Do item."
    end
      return

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @items = @user.items.find(params[:id])
    if @items.destroy
      flash[:notice] = "\"#{@items.name} has been successfully removed"
      redirect_to user_path(current_user), notice: 'Item destroyed'
    else
      flash[:error] = "Failed to remove task"
    end
      return

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def items_params
    params.require(:item).permit(:name)
  end
end
