class AddActivityTypeToActivities < ActiveRecord::Migration[5.2]
  def change
    add_reference :activities, :activity_type, foreign_key: true
  end
end
