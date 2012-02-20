module PlymouthSoftware
  module Core
    class Railtie < Rails::Railtie
      initializer "plymouth-software.core.action-view.helpers" do |app|
        ::ActionView::Base.send :include, ActionView::Helpers::ContentHelpers
      end
    end
  end
end
