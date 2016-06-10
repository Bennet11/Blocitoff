class Item < ActiveRecord::Base
  belongs_to :user

  default_scope { order('updated_at ASC') }

  def days_left
   -1 - (DateTime.now.utc.to_date - created_at.to_date).to_i
  end
end
