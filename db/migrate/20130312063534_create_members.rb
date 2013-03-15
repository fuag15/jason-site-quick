class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.references :project

      t.timestamps
    end
    add_index :members, :project_id
  end
end
