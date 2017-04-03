class RemoveInfluenceFromReferences < ActiveRecord::Migration[5.0]
  def change
      remove_column :references, :from
      remove_column :references, :influence
  end
end
