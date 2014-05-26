class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :list_id
      t.string :list_name
      t.string :list_description
      t.string :campaign_id
      t.string :active
      t.datetime :list_changedate
      t.datetime :list_lastcalldate
      t.string :reset_time

      t.timestamps
    end
  end
end
