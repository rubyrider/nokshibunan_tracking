class AddDetailsToTrackingStatuses < ActiveRecord::Migration[6.0]
  def change
    add_column :tracking_statuses, :details, :text
  end
end
