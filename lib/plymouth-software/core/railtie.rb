require "plymouth-software/core/action_view/helpers/content_helpers"

module PlymouthSoftware
  module Core
    class Railtie < Rails::Railtie
      initializer "plymouth-software.core.view_helpers" do |app|
        ::ActionView::Base.send :include, ActionView::Helpers::ContentHelpers
      end
    end
  end
end
