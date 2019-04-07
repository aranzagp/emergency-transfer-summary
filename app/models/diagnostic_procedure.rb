# frozen_string_literal: true

class DiagnosticProcedure < ApplicationRecord
  belongs_to :patient

  def full_description
    "#{description} on #{date}, at #{time}"
  end
end
