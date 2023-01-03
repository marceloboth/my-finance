# frozen_string_literal: true

module Incomes
  class ListComponent < BaseViewComponent
    def initialize(incomes:)
      @incomes = incomes
    end
  end
end
