# frozen_string_literal: true

class Treatment < ApplicationRecord
  belongs_to :patient

  def full_description
    "#{description} to #{necessity}"
  end
end
