class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :commenter_id
      t.text :body
      t.references :post, foregin_key: true
      t.timestamps
    end
  end
end
