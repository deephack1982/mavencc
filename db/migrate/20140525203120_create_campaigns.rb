class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :campaign_id
      t.string :campaign_name
      t.string :campaign_description
      t.string :active
      t.datetime :campaign_changedate
      t.datetime :campaign_logindate
      t.string :user_group

      t.timestamps
    end
  end
end
