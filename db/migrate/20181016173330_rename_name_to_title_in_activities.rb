class RenameNameToTitleInActivities < ActiveRecord::Migration[5.2]
  def change
    rename_column :activities, :name, :title
  end
end
