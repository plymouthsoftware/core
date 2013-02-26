module PlymouthSoftware
  module Core
    class Railtie < ::Rails::Railtie
      ::ActionView::Base.extend, ActionView::Helpers::ContentHelpers
      ::ActiveRecord::Base.extend ActiveRecord::User
      ::ActiveRecord::Base.extend ActiveRecord::Priceable
      ::ActionController::Base.extend ActionController::Authentication
    end
  end
end
