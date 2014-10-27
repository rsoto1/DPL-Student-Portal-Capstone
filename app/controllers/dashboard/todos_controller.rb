class Dashboard::TodosController < ApplicationController
    before_action :set_todo, only: [:show, :edit, :update, :destroy]
    before_action :set_user

  def new
    @todo = user.todos.new
  end

  def create
    @todo = @user.todos.new(todo_params)
    if @todo.save
      redirect_to dashboard_path, notice: 'You saved a new item'
    else
      alert_and_render('Could not save location info', :new)
    end
  end

  def update
    if @todo.update_attributes(todo_params)
      redirect_to root_path, notice: 'All up to date'
    else
      alert_and_render('There was an issue updating', :edit)
    end
  end

  def destroy
    @todo.destroy
    redirect_to dashboard_path
  end

  private

 def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:item)
  end

  def set_user
    @user ||= current_user
  end
end
