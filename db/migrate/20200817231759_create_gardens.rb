class CreateGardens < ActiveRecord::Migration[6.0]
  def change
    create_table :gardens do |t|
      t.string :name
      t.string :type
      t.belongs_to :gardener, null: false, foreign_key: true

      t.timestamps
    end
  end
end
