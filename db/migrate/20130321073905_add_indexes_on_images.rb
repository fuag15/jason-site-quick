class AddIndexesOnImages < ActiveRecord::Migration
  def change
    add_index :images, :project_id
  end
end
