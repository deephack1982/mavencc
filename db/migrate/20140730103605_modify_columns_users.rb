class ModifyColumnsUsers < ActiveRecord::Migration
  def change
	change_table :users do |t|
		t.column :force_change_password, "ENUM('Y','N')"
	end
  end
end
