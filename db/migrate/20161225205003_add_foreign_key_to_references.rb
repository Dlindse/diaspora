class AddForeignKeyToReferences < ActiveRecord::Migration[5.0]
  def change
    add_reference :references, :influence, foreign_key: true
  end
end
