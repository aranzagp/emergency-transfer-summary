# frozen_string_literal: true

class OrderFrequency < ApplicationRecord
  enum unit: %i[hour]
  belongs_to :medication_order
end
