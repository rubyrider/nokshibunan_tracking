class AddIconNameToTrackingStatuses < ActiveRecord::Migration[6.0]
  def change
    add_column :tracking_statuses, :icon_name, :string
  end
end
