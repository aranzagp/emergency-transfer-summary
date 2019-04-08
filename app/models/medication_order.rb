# frozen_string_literal: true

class MedicationOrder < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  enum unit: %i[mg]
  enum route: %i[PO IM SC]

  has_one :frequency, class_name: 'OrderFrequency'
  belongs_to :patient

  def full_medication
    "#{name} #{custom_dosage}#{unit} #{route} #{frequency&.period} to #{necessity}"
  end

  def custom_dosage
    number_with_precision(dosage, precision: 2, strip_insignificant_zeros: true)
  end
end
