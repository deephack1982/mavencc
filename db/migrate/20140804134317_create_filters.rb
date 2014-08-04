class CreateFilters < ActiveRecord::Migration
  def change
    create_table :lead_filters do |t|
      t.string :lead_filter_id
      t.string :lead_filter_name
      t.string :lead_filter_comments
      t.text :lead_filter_sql
      t.string :user_group
      t.references :user_group, index: true

      t.timestamps
    end
  end
end
