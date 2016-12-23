class RemoveForeignKeyFromReferences < ActiveRecord::Migration[5.0]
  def change
    remove_reference :references, :influence, foreign_key: true
    
    add_column :references, :from, :string
  end
end
