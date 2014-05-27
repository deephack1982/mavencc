class CreateLeads < ActiveRecord::Migration
  def change
    create_table :list do |t|
      t.integer :lead_id
      t.string :status
      t.string :user
      t.string :vendor_lead_code
      t.string :source_id
      t.references :list, index: true
      t.string :called_since_last_reset
      t.string :phone_code
      t.string :phone_number
      t.string :title
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :state
      t.string :province
      t.string :postal_code
      t.string :country_code
      t.string :gender
      t.date :date_of_birth
      t.string :alt_phone
      t.string :email
      t.string :security_phrase
      t.text :comments
      t.integer :called_count
      t.datetime :last_local_call_time
      t.integer :rank
      t.string :owner

      t.timestamps
    end
  end
end
