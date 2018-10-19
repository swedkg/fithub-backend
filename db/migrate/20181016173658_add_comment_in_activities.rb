class AddCommentInActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :comment, :string
  end
end
