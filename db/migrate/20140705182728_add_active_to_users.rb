class AddActiveToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.column :active, "ENUM('Y','N')"
  	end
  end
end
