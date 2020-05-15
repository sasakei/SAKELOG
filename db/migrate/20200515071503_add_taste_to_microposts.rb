class AddTasteToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :taste, :string
    add_column :microposts, :flavor, :string
  end
end
