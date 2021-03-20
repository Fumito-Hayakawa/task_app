class AddStatusToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :content, :string
  end
end
