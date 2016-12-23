class AddInfluencetoReferences < ActiveRecord::Migration[5.0]
  def change
      add_column :references, :influence, :string
  end
end
