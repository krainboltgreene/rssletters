class AddQue < ActiveRecord::Migration
  def change
    Que.migrate! version: 3
  end
end
