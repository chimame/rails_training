class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :sub_title
      t.string :author
      t.date :release_date
      t.integer :price

      t.timestamps
    end
  end
end
