class TasksController < ApplicationController
  def index
    @nav_index = 'active'
    @data = Task.all
  end

  def show
    @msg = 'Detail'
    @data = Task.find_by(id: params[:id])
    if @data == nil
      redirect_to root_path, notice: '[ERROR!!]Unable to view tasks.Task not found.'
    end
  end

  def new
    @nav_add = 'active'
    @task = Task.new
  end

  def create
    if request.post? then
      obj = Task.new(task_params)
      if 0 < obj[:title].length && 0 < obj[:content].length
        if 10 >= obj[:title].length && 40 >= obj[:content].length
          if obj.save
            redirect_to root_path, notice: 'Successfully added the task.'
          else
            redirect_to new_task_path, notice: '[ERROR!!]Failed to add task.'
          end
        else
          redirect_to new_task_path, notice: '[ERROR!!]The number of characters that can be registered has been exceeded.'
        end
      else
        redirect_to new_task_path, notice: '[ERROR!!]Please enter a character.'
      end
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
    if @task != nil
      @msg = "edit data.[id = " + @task.id.to_s + "]"
    else
      redirect_to root_path, notice: '[ERROR!!]Task not found.'
    end
  end

  def update
    obj = Task.new(task_params)
    if 0 < obj[:title].length && 0 < obj[:content].length
      if 10 >= obj[:title].length && 40 >= obj[:content].length
        obj = Task.find(params[:id])
        obj.update(task_params)
        redirect_to root_path, notice: 'Task changes applied.'
      else
        redirect_to edit_task_path, notice: '[ERROR!!]The number of characters that can be registered has been exceeded.'
      end
    else
      redirect_to edit_task_path, notice: '[ERROR!!]Please enter a character.'
    end
  end

  def destroy
    obj = Task.find_by(id: params[:id])
    if obj != nil
      if obj.destroy
        redirect_to root_path, notice: 'Deletion completed.' 
      else
        redirect_to root_path, notice: '[ERROR!!]Failed to delete task.'
      end
    else
      redirect_to root_path, notice: '[ERROR!!]Task not found.It may have already been deleted.'
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :content)
  end
end
