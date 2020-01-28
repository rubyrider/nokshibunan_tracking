# frozen_string_literal: true

# == Schema Information
#
# Table name: notes
#
#  id            :bigint           not null, primary key
#  noteable_type :string(255)
#  noteable_id   :integer
#  body          :text(65535)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Note < ApplicationRecord
  belongs_to :noteable, polymorphic: true
end
