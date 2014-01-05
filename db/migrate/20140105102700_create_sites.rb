class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :company
      t.string :site
      t.string :license_type
      t.string :license_code
      t.text :modules

      t.timestamps
    end
  end
end
