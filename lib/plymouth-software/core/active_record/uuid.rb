module PlymouthSoftware
  module Core
    module ActiveRecord
      module UUID
        def has_uuid
          validates :uuid, :presence => true, :uniqueness => { :case_sensitive => false }
      
          before_validation :generate_uuid!

          extend SingletonMethods
          include InstanceMethods
        end
      end

      module SingletonMethods
      end

      module InstanceMethods

      protected

        def generate_uuid!
          self.uuid = ::UUID.generate if self.uuid.blank?
            
          self.uuid
        end
      end
    end
  end
end