class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :userID
      t.string :userPW
      t.string :userName

      t.timestamps
    end
  end
end
