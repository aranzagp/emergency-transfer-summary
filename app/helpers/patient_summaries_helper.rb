# frozen_string_literal: true

module PatientSummariesHelper
  def sentence(array, method)
    array.map(&method).to_sentence
  end
end
