# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def date
    moment.strftime('%B%e, %Y')
  end

  def time
    moment.strftime('%I:%M %p')
  end
end
