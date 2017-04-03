class AddFromToReferences < ActiveRecord::Migration[5.0]
  def change
    add_column :references, :from, :string
  end
end
