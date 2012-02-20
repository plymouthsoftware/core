module PlymouthSoftware
  class CoreRailtie < ::Rails::Railtie
    initializer "plymouth_software.core_railtie_mixin_content_helpers" do |app|
      ::ActionView::Base.send :include, ::PlymouthSoftware::Core::ActionView::Helpers::ContentHelpers
    end
  end
end
