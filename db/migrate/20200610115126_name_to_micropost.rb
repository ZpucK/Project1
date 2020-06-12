class NameToMicropost < ActiveRecord::Migration[6.0]
  def change
    add_column :microposts, :name, :string
  end
end
