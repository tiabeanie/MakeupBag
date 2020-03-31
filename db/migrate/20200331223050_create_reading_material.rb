class CreateReadingMaterial < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :bookshelf_id
    end
  end
end
