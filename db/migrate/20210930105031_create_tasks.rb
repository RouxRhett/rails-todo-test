class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :id
      t.text :title
      t.text :content

      t.timestamps
    end
  end
end
