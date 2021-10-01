class TasksController < ApplicationController
  def index
    @msg = '現在登録されているタスク一覧です。'
    @data = Task.all
  end

  def show
    @msg = 'タスクの詳細'
    @data = Task.find(params[:id])
  end
end
