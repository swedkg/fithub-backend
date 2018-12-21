class ChangeDateAndDurationTypeToNumber < ActiveRecord::Migration[5.2]
  def change
    change_column :activities, :date, "integer USING CAST(:date AS integer)"
    change_column :activities, :duration, :integer
  end
end
