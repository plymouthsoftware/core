module PlymouthSoftware
  module Core
    class Railtie < ::Rails::Railtie
      ::ActionView::Base.send :include, ActionView::Helpers::ContentHelpers
      ::ActiveRecord::Base.extend ActiveRecord::User
      ::ActiveRecord::Base.extend ActiveRecord::Priceable
    end
  end
end
