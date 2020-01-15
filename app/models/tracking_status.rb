# frozen_string_literal: true

# == Schema Information
#
# Table name: tracking_statuses
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  details    :text(65535)
#

class TrackingStatus < ApplicationRecord
end
