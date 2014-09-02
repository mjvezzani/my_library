class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, :author
      t.integer :isbn

      t.timestamps
    end
  end
end
