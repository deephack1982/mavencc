class CreateStatusCategories < ActiveRecord::Migration
  def change
  	create_table :status_categories do |t|
      t.string :vsc_id
      t.string :vsc_name
      t.string :vsc_description
      t.column :tovdad_display, "ENUM('Y','N')"
      t.column :sale_category, "ENUM('Y','N')"
      t.column :dead_lead_category, "ENUM('Y','N')"

      t.timestamps
    end
  end
end
