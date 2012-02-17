require "plymsoftware_core/action_view/helpers/content_helpers"

module PlymsoftwareCore
  class Railtie < Rails::Railtie
    initializer "plymsoftware_core.view_helpers" do |app|
      ActionView::Base.send :include, ActionView::Helpers::ContentHelpers
    end
  end
end

