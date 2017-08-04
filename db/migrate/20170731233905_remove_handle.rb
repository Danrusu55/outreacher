class RemoveHandle < ActiveRecord::Migration[5.0]
  def change
    remove_column :entries, :handle
  end
end
