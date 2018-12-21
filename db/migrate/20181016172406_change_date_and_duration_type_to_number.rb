class ChangeDateAndDurationTypeToNumber < ActiveRecord::Migration[5.2]
  def change
    change_column :activities, :date, "integer USING cast date::integer"
    change_column :activities, :duration, :integer
  end
end
