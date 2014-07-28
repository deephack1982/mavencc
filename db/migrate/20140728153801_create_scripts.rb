class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :script_id, :limit => 10
      t.string :script_name, :limit => 50
      t.string :script_comments
      t.text :script_text
      t.column :active, "ENUM('Y','N')"
      t.string :user_group, :limit => 20

      t.timestamps
    end
   add_reference :scripts, :user_group, index: true
  end
end
