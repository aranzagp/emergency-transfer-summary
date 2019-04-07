# frozen_string_literal: true

class OrderFrequency < ApplicationRecord
  enum unit: %i[hr]
  belongs_to :medication_order

  def period
    "q#{value}#{unit}"
  end
end
