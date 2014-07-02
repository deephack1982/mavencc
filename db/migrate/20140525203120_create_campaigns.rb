class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :campaign_id, :limit => 8
      t.string :campaign_name, :limit => 40
      t.string :campaign_description
      t.column :active, "ENUM('Y','N')"
      t.datetime :campaign_changedate
      t.datetime :campaign_logindate
      t.string :user_group, :limit => 20

      t.timestamps
    end
  end
end
