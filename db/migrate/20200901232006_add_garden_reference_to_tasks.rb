class AddGardenReferenceToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :garden, null: false, foreign_key: true
  end
end
