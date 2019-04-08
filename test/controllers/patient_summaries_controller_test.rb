require 'test_helper'

class PatientSummariesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get patient_summaries_show_url
    assert_response :success
  end
end
