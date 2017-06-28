class TodoItemsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  def create
    @todo_item = @todo_list.todo_items.create(params[:todo_item].permit(:content))
    redirect_to @todo_list
  end
  private

  def set_todo_list
    @todo_list = TodoList.where(id: params[:todo_list_id])
  end
  def todo_item_params
    params.require(:todo_item).permit(:content)
  end
end
