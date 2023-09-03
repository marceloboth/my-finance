require 'infra/contracts'

module Income
  class NewContract < Contract
    params do
      required(:id).value(:string)
      required(:description).value(:string)
      required(:value).value(:float)
      required(:user_id).value(:integer)

      optional(:received_at).value(:date)
    end
  end
end
