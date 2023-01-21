# frozen_string_literal: true

module Incomes
  class ListComponent < BaseViewComponent
    def initialize(incomes:)
      @incomes = incomes
    end

    def total_amount
      @incomes.sum(&:value).to_f
    end
  end
end
