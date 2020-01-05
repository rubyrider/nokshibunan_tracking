class Admin::DashboardDecorator
  def stats
    TrackingStatus.select('tracking_statuses.id, tracking_statuses.name, count(orders.id) as order_count')
        .joins('left outer join orders on orders.tracking_status_id = tracking_statuses.id')
        .group('tracking_statuses.id')
  end
end