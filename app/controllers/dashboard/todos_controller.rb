class Dashboard::TodosController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user
    before_action :set_todo, only: :destroy

  def new
    @todo = @user.todos.new
  end

  def create
    @todo = @user.todos.new(todo_params)
    if @todo.save
      redirect_to dashboard_path, notice: 'You saved a new item'
    else
      alert_and_render('Could not save location info', :new)
    end
  end

  def destroy
    @todo.destroy
    redirect_to dashboard_path
  end

  private

 def set_todo
    @todo = @user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:item)
  end

  def set_user
    @user ||= current_user
  end
end
