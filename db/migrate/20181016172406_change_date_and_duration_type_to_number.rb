class ChangeDateAndDurationTypeToNumber < ActiveRecord::Migration[5.2]
  def change
    change_column :activities, :date, :integer, "USING date::integer"
    change_column :activities, :duration, :integer
  end
end
