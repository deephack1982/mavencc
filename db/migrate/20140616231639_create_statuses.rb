class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :status
      t.string :status_name
      t.column :selectable, "ENUM('Y','N')"
      t.column :human_answered, "ENUM('Y','N')"
      t.string :category
      t.column :sale, "ENUM('Y','N')"
      t.column :dnc, "ENUM('Y','N')"
      t.column :customer_contact, "ENUM('Y','N')"
      t.column :not_interested, "ENUM('Y','N')"
      t.column :unworkable, "ENUM('Y','N')"
      t.column :scheduled_callback, "ENUM('Y','N')"
      t.column :completed, "ENUM('Y','N')"
      t.references :status_category, index: true

      t.timestamps
    end
  end
end
