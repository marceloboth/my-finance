class AuthenticatedController < ApplicationController
  before_action :authenticate_user!

  around_action :use_request_metadata

  private

  def use_request_metadata(&block)
    Rails.configuration.event_store.with_metadata(request_medata, &block)
  end

  def request_medata
    {
      user_id: current_user.id
    }
  end
end
