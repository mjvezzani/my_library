class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :first_name, :last_name
      t.string :address
      t.integer :phone

      t.timestamps
    end
  end
end
