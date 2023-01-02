# frozen_string_literal: true

module Core
  class ModalComponent < ViewComponent::Base
    include Turbo::FramesHelper

    renders_one :title
    renders_one :description
    renders_one :body
  end
end
