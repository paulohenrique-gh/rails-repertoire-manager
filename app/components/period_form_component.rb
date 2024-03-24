# frozen_string_literal: true

class PeriodFormComponent < ViewComponent::Base
  def initialize(period:)
    super
    @period = period
  end
end
