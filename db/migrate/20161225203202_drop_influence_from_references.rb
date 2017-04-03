class DropInfluenceFromReferences < ActiveRecord::Migration[5.0]
  def change
       remove_reference :references, :influence, foreign_key: true
  end
end
