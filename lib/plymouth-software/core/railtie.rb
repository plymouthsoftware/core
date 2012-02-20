require "plymouth-software/core/action_view/helpers/content_helpers"

module PlymouthSoftware
  module Core
    class Railtie < Rails::Railtie
      initializer "plymouth-software.core" do |app|
        ::ActionView::Base.send :include, ActionView::Helpers::ContentHelpers
        ::ActionController::Base.extend ActionController::Authentication
        ::ActiveRecord::Base.extend ActiveRecord::Priceable
        ::ActiveRecord::Base.extend ActiveRecord::User
      end
    end
  end
end
