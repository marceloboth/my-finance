# frozen_string_literal: true

Dry::Validation.load_extensions(:monads)
Dry::Validation.load_extensions(:predicates_as_macros)

module Infra
  class Contracts < Dry::Validation::Contract
    import_predicates_as_macros
  end
end
