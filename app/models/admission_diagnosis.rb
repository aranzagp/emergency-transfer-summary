# frozen_string_literal: true

class AdmissionDiagnosis < Diagnosis
  belongs_to :admission
end
