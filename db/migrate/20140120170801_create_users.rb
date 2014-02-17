class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user
      t.string :pass
      t.string :full_name
      t.integer :user_level
      t.string :user_group
      t.string :phone_login
      t.string :phone_pass

      t.timestamps
    end
  end
end
