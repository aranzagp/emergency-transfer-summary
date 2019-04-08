# frozen_string_literal: true

module PatientSummariesHelper
  def sentence(array, method)
    array.map(&method).to_sentence
  end

  def paragraph_1(patient)
    I18n.t('p1', patient_age: patient.age, patient_gender:   patient.gender, facility_name: patient.facility.name, patient_admission_date: patient.admission.date, patient_admission_time: patient.admission.time, patient_admission_diagnoses: sentence(patient.admission.diagnoses, :described_code), patient_admission_symptoms: sentence(patient.admission.symptoms, :description), patient_admission_observations: sentence(patient.admission.observations, :description))
  end

  def paragraph_2(patient)
    I18n.t('p2', patient_allegies: sentence(patient.allergies, :description), patient_chronic_conditions: sentence(patient.chronic_conditions, :described_code), patient_medications: sentence(patient.medications, :full_medication) )
  end

  def paragraph_3(patient)
    I18n.t('p3', patient_diagnostic_procedures: sentence(patient.diagnostic_procedures, :full_description), patient_diagnoses: sentence(patient.diagnoses, :described_code), patient_treatments: sentence(patient.treatments, :full_description))
  end
end
