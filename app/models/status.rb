class Status < ActiveRecord::Base
  belongs_to :status_category
  def full_status_name
    "#{status} - #{status_name}"
  end
end
