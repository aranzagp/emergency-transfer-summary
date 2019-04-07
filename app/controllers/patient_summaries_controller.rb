# frozen_string_literal: true

class PatientSummariesController < ApplicationController
  def show
    @patient = Patient.first
  end
end
