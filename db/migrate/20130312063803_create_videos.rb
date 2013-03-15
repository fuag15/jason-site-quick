class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :url
      t.integer :rank
      t.float :aspect
      t.references :article
      t.references :project

      t.timestamps
    end
    add_index :videos, :article_id
    add_index :videos, :project_id
  end
end
