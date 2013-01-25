module PlymouthSoftware
  module Core
    module ActionController
      module Authentication
        def authenticating_controller
          before_filter :authentication_required
          helper_method :current_user
          
          extend SingletonMethods
          include InstanceMethods
        end
        
        module SingletonMethods
        end

        module Scopes
          def active
            where('active = ?', true)
          end
        end

        module InstanceMethods
          def current_user
            return nil if session[:user_id].blank?
            @current_user ||= User.find_by_id(session[:user_id]) 
          end

          def authentication_required
            if self.current_user.nil?
              redirect_to sign_in_url, :notice => 'You must sign in to continue.' and return
            end
          end
        end
      end
    end
  end
end
