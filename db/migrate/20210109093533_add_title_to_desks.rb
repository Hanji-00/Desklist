class AddTitleToDesks < ActiveRecord::Migration[5.2]
  def change
    add_column :desks, :title, :string
  end
end
