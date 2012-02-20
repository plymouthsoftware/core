module PlymsoftwareCore
  module ActiveRecord
    module Priceable
      def has_price
        @@price_scalar = 1000.0
        cattr_accessor :price_scalar

        attr_accessible :price
        
        extend Scopes
        extend SingletonMethods

        include InstanceMethods
      end
      
      module SingletonMethods
      end

      module Scopes
      end

      module InstanceMethods
        def price=(value)
          self.price_in_pence = value.blank? ? nil : (value.to_f * @@price_scalar).to_i
        end

        def price
          return nil if price_in_pence.nil?
          self.price_in_pence.to_f / @@price_scalar
        end
      end
    end
  end
end

ActiveRecord::Base.extend PlymsoftwareCore::ActiveRecord::Priceable
