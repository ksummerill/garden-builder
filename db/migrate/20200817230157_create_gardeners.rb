class CreateGardeners < ActiveRecord::Migration[6.0]
  def change
    create_table :gardeners do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
