class AddImageToAbout < ActiveRecord::Migration
  def change
    add_column :images, :about_id, :integer
    add_index :images, :about_id
  end
end
