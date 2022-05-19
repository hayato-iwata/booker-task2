class CreateBookViews < ActiveRecord::Migration[6.1]
  def change
    create_table :book_views do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.timestamps
    end
  end
end
