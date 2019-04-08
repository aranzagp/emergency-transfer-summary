require 'test_helper'

class SummaryPdfTest < ActiveSupport::TestCase
  include PatientSummariesHelper

  def setup
    @patient = patients(:thomas)
    @pdf = SummaryPdf.new(@patient).render
    @pdf_analysis = PDF::Inspector::Text.analyze(@pdf)
  end

  test 'contains the patient information' do
    [@patient.first_name, @patient.last_name, @patient.mr].each do |patient_data|
      assert @pdf_analysis.strings.include?(patient_data)
    end
  end

  test 'contains the summary' do
    [paragraph_1(@patient), paragraph_2(@patient), paragraph_3(@patient)].each do |p|
      @pdf_analysis.strings.join.include?(p)
    end
  end
end
