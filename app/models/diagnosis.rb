# frozen_string_literal: true

class Diagnosis < ApplicationRecord
  belongs_to :patient

  def described_code
    "#{description} (#{coding_system}#{code})"
  end
end
