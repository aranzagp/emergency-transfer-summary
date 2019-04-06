# frozen_string_literal: true

class Admission < ApplicationRecord
  has_many :diagnoses, class_name: 'AdmissionDiagnosis'
  has_many :symptoms
  has_many :observations

  belongs_to :patient
end
