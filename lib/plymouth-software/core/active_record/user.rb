module PlymouthSoftware
  module Core
    module ActiveRecord
      module User
        def is_user
          attr_accessible :name, :email, :first_name, :last_name, :password, :password_confirmation
          
          validates :email, :presence => true

          validates :first_name, :presence => true
          validates :last_name, :presence => true
          validates :password, :confirmation => true

          has_secure_password
          
          extend Scopes
          extend SingletonMethods

          include InstanceMethods
        end
        
        module SingletonMethods
          def authenticate_with_email_and_password(email_address, pass)
            verified.active.find_by_email(email_address).try(:authenticate, pass)
          end
        end

        module Scopes
          def active
            where(:active => true)
          end

          def verified
            where('verified_at IS NOT NULL')
          end
        end

        module InstanceMethods
          def name
            [self.first_name, self.last_name].join(' ').strip
          end

          def name=(value)
            self.first_name = self.last_name = nil
            return nil if value.blank?

            parts = value.split(' ')

            self.last_name = parts.delete_at(parts.count - 1)
            self.first_name = parts.join(' ')

            name
          end

          def verified?
            ! self.verified_at.blank? 
          end

          def verify!(token = nil)
            update_attribute(:verified_at, Time.now) if token == self.verification_token
          end
        end
      end
    end
  end
end
