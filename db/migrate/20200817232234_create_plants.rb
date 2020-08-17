class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :amount_of_sun
      t.string :water_frequency
      t.string :category
      t.belongs_to :garden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
