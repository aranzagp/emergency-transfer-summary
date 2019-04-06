# frozen_string_literal: true

class Symptom < ApplicationRecord
  belongs_to :admission
end
