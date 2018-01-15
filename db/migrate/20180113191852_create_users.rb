class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.integer :age
      t.decimal :height_feets
      t.decimal :height_inches
      t.decimal :weight
      t.string :favorite_color

      t.timestamps
    end
  end
end
