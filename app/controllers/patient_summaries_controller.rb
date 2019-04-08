# frozen_string_literal: true

class PatientSummariesController < ApplicationController
  def show
    @patient = Patient.first
    @facility = Facility.first
    respond_to do |format|
      format.html
      format.pdf do
        pdf = SummaryPdf.new(@patient)
        send_data pdf.render, filename: 'patient_summary', type: 'application/pdf'
      end
    end
  end
end
