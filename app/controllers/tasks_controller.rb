class TasksController < ApplicationController
  def index
    @msg = ''
    @data = Task.all
  end

  def show
    @msg = 'Detail'
    @data = Task.find(params[:id])
  end

  def add
    @msg ='Added a task.'
  end

  def create
    if request.post? then
      obj = Task.create(
        title:params['title'],
        content:params['content']
      )
    end
    redirect_to '/'
  end

  def edit
    @msg = "edit data.[id = " + params[:id] + "]"
    @task = Task.find(params[:id])
  end

  def update
    obj = Task.find(params[:id])
    obj.update(task_params)
    redirect_to '/'
  end

  private
  def task_params
    params.require(:task).permit(:title, :content)
  end
end
