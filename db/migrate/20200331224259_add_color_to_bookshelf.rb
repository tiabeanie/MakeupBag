class AddColorToBookshelf < ActiveRecord::Migration
  def change
    add_column :bookshelves, :color, :string
  end
end
