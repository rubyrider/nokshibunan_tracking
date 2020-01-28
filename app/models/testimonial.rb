# frozen_string_literal: true

# == Schema Information
#
# Table name: testimonials
#
#  id           :bigint           not null, primary key
#  name         :string(255)
#  title        :string(255)
#  comment      :text(65535)
#  image        :text(65535)
#  comment_date :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Testimonial < ApplicationRecord
end
