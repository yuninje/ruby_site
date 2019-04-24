class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.string :author
      t.string :genre
      t.timestamps
    end
  end
end
