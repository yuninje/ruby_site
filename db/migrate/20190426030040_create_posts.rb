class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :author_id
      t.string :genre
      t.integer :view_count, default: 0
      t.timestamps
    end
  end
end
