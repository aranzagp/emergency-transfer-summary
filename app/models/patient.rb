# frozen_string_literal: true

class Patient < ApplicationRecord
  has_many :allergies
  has_many :chronic_conditions
  has_many :medications, class_name: 'MedicationOrder'
  has_many :diagnostic_procedures
  has_many :diagnoses, class_name: 'MedicalDiagnosis'
  has_many :treatments

  has_one :admission, dependent: :destroy

  enum gender: %i[male female other]
end
