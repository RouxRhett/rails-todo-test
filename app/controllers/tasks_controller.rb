class TasksController < ApplicationController
  def index
    @msg = '現在登録されているタスク一覧です。'
    @data = Task.all
  end

  def test
    @msg = 'ここは削除されます。'
  end
end
