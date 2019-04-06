# frozen_string_literal: true

class MedicationOrder < ApplicationRecord
  enum unit: %i[mg]
  enum route: %i[PO IM SC]

  has_one :frequency, class_name: 'OrderFrequency'
  belongs_to :patient
end
