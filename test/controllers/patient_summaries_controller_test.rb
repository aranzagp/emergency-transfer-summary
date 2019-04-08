require 'test_helper'

class PatientSummariesControllerTest < ActionDispatch::IntegrationTest
  include PatientSummariesHelper

  def setup
    @patient = patients(:thomas)
  end

  test "should get show" do
    get patient_summaries_show_url
    assert_response :success
  end

  test 'return the patient information correctly' do
    get patient_summaries_show_url
    response.body.include?(@patient.first_name)
    response.body.include?(@patient.last_name)
    response.body.include?(@patient.mr)
  end

  test 'return the patients summary correctly' do
    get patient_summaries_show_url
    response.body.include?(paragraph_1(@patient))
    response.body.include?(paragraph_2(@patient))
    response.body.include?(paragraph_3(@patient))
  end

  test 'match the summary strings' do
    assert_equal sentence(@patient.admission.diagnoses, :described_code), 'a fracture of upper end of the right tibia (S82.101)'
    assert_equal sentence(@patient.admission.symptoms, :description), 'limited bending of the joint, swelling and severe pain'
    assert_equal sentence(@patient.admission.observations, :description), 'No soft tissues were damaged'
    assert_equal sentence(@patient.allergies, :description), 'hypersensitivity to aspirin or NSAIDs and gluten intolerance'
    assert_equal sentence(@patient.chronic_conditions, :described_code), 'Asthma (J45)'
    assert_equal sentence(@patient.medications, :full_medication), 'Acetaminophen 500mg PO q4hr to relieve pain and Naproxen 500mg PO q6hr to relieve sweling'
    assert_equal sentence(@patient.diagnoses, :described_code), 'a closed fracture in the right tibia (S82.101A)'
    assert_equal sentence(@patient.treatments, :full_description), 'temporary bracing the right leg to restrict the motion'
  end
end
