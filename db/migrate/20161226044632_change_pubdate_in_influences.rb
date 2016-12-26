class ChangePubdateInInfluences < ActiveRecord::Migration[5.0]
  def change
      change_column :influences, :pubdate, :string
  end
end
