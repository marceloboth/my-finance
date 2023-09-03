# frozen_string_literal: true

module Incomes
  class FormComponent < BaseViewComponent
    attr_accessor :income, :description, :value, :received_at

    def initialize(income: nil)
      @income = income
      income_attributes
    end

    def income_attributes
      @description = income&.description
      @value = income&.value
      @received_at = income&.received_at
    end

    def submit_url
      income ? income_path(income) : incomes_path
    end

    def submit_method
      income ? :patch : :post
    end
  end
end
