class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.integer :age
      t.integer :height_feets
      t.integer :height_inches
      t.integer :weight
      t.string :favorite_color

      t.timestamps
    end
  end
end
