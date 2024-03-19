# frozen_string_literal: true

class PeriodFormComponent < ViewComponent::Base
  def initialize(period:)
    @period = period
  end
end
