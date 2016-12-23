class AddForeignKeyToReferences < ActiveRecord::Migration[5.0]
  def change
    add_reference :references, :influence, foreign_key: true
    
    remove_column :references, :from
  end
end
