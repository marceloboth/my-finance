# frozen_string_literal: true

module Incomes
  class ListComponent < BaseViewComponent
    def initialize(incomes:)
      @incomes = incomes
    end

    def total_amount
      @incomes.sum(&:value).to_f
    end

    def action_button_css
      'inline-flex items-center justify-center rounded-md border border-transparent bg-indigo-600 px-4 py-2 ' +
        'text-sm font-medium text-white shadow-sm hover:bg-indigo-700 ' +
        'focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 sm:w-auto'
    end

    def danger_action_button_css
      'inline-flex w-full justify-center rounded-md bg-red-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-red-500 sm:ml-3 sm:w-auto'
    end
  end
end
