class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :first_name, :last_name, :address, :phone
      t.integer :user_id

      t.timestamps
    end
  end
end
