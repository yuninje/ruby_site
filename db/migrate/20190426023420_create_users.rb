class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_id, unique: true
      t.string :password_digest
      t.string :name
      t.timestamps
    end
  end
end
