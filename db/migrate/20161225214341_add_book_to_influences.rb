class AddBookToInfluences < ActiveRecord::Migration[5.0]
  def change
    add_column :influences, :book, :string
  end
end
