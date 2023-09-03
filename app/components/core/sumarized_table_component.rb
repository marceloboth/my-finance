# frozen_string_literal: true

module Core
  class SumarizedTableComponent < BaseViewComponent
    renders_one :new_record_link
    renders_many :rows
    renders_one :extra_sum
    renders_one :total_sum

    attr_reader :id
    def initialize(id:)
      @id = id
    end
  end
end
