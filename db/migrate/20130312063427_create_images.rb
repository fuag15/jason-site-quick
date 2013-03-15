class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :file
      t.references :article
      t.references :project

      t.timestamps
    end
    add_index :images, :article_id
  end
end
