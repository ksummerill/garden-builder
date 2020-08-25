class ChangeTypeToVariety < ActiveRecord::Migration[6.0]
  def change
    rename_column :gardens, :type, :variety
  end
end
