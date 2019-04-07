# frozen_string_literal: true

class PatientSummariesController < ApplicationController
  def show
    @patient = Patient.first
    @facility = Facility.first
  end
end
