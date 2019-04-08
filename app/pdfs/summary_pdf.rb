# frozen_string_literal: true

class SummaryPdf < Prawn::Document
  include PatientSummariesHelper

  def initialize(patient)
    super()
    @patient = patient
    header_rows_section
    facility_name_section
    patient_informaion_section
    summary_section
  end

  def header_rows_section
    table header_rows do
      row(0..1).font_style = :bold
      self.row_colors = %w[DDDDDD FFFFFF]
      self.width = 480
    end
  end

  def facility_name_section
    table facility_name do
      self.width = 480
      row(0).font_style = :bold
      row(0).borders = %i[top left right]
      row(1).borders = %i[bottom left right]
    end
  end

  def patient_informaion_section
    table patient_information do
      row(0).font_style = :bold
      self.width = 480
      row(1).borders = %i[top left right]
      row(2).borders = %i[bottom left right]
    end
  end

  def summary_section
    table summary do
      self.width = 480
      row(0).font_style = :bold
      row(0).borders = %i[top left right]
      row(1..2).borders = %i[left right]
      row(3).borders = %i[bottom left right]
    end
  end

  def header_rows
    [[I18n.t('emergency_transfer_summary')]] + [[I18n.t('transfering_facility')]]
  end

  def facility_name
    [[I18n.t('name')]] + [[@patient.facility.name]]
  end

  def patient_information
    [[{ content: I18n.t('patient_information'), colspan: 4 }]] + [[I18n.t('first_name'), I18n.t('middle_name'), I18n.t('last_name'), I18n.t('mr')]] +
      [[@patient.first_name, @patient.middle_name, @patient.last_name, @patient.mr]]
  end

  def summary
    [[I18n.t('summary')]] + [[paragraph_1(@patient)]] + [[paragraph_2(@patient)]] + [[paragraph_3(@patient)]]
  end
end
