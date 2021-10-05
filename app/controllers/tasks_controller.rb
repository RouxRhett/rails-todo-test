class TasksController < ApplicationController
  def index
    @nav_index = 'active'
    @data = Task.all
  end

  def show
    @msg = 'Detail'
    @data = Task.find(params[:id])
  end

  def add
    @nav_add = 'active'
    @task = Task.new
  end

  def create
    if request.post? then
      obj = Task.create(task_params)
    end
    redirect_to root_path ,notice: 'Successfully added the task.'
  end

  def edit
    @task = Task.find(params[:id])
    @msg = "edit data.[id = " + @task.id.to_s + "]"
  end

  def update
    obj = Task.find(params[:id])
    obj.update(task_params)
    redirect_to root_path ,notice: 'Task changes applied.'
  end

  def delete
    obj = Task.find(params[:id])
    if obj.destroy
      redirect_to root_path ,notice: 'Deletion completed.' 
    else
      render :edit
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :content)
  end
end
