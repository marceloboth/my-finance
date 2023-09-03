require 'infra/contracts'

module Income
  class Contract < Infra::Contracts
    rule(:description).validate(min_size?: 5)
    rule(:value).validate(gteq?: 0.1)
    rule(:received_at).validate(lteq?: Date.today)
  end
end
