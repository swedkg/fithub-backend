class ActivityType < ApplicationRecord
  # belongs_to :activity
  has_many :activities
end
