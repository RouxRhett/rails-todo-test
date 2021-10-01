class TasksController < ApplicationController
  def index
    @msg = 'List'
    @data = Task.all
  end

  def show
    @msg = 'Detail'
    @data = Task.find(params[:id])
  end
end
