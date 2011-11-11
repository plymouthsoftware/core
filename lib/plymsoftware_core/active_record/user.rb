module PlymsoftwareCore
  module ActiveRecord
    module User
      def is_user
        attr_accessible :name, :email, :first_name, :last_name, :password
        
        validates :email, :presence => true

        validates :first_name, :presence => true
        validates :last_name, :presence => true

        validates :password, :confirmation => true
        validates :password_hash, :presence => true
        
        extend Scopes
        extend SingletonMethods

        include InstanceMethods
      end
      
      module SingletonMethods
        def authenticate_with_email_and_password(email_address, pass)
          user = self.find_by_email(email_address)
          if user && user.password_hash == Digest::SHA2.hexdigest(pass + user.password_salt)
            return user
          end
          
          nil
        end
      end

      module Scopes
        def active
          where('active = ?', true)
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

        def verify!
          update_attribute(:verified_at, Time.now)
        end

        def password
          @password
        end

        def password=(pass)
          @password = pass

          self.password_salt = Digest::SHA2.hexdigest(Time.now.to_s + rand(1000).to_s)
          self.password_hash = Digest::SHA2.hexdigest(@password + password_salt)

          self.password_hash
        end
      end
    end
  end
end

ActiveRecord::Base.extend PlymsoftwareCore::ActiveRecord::User
