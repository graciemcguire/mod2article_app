class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :category1
      t.string :category2
      t.string :category3
      t.string :name

      t.timestamps
    end
  end
end
