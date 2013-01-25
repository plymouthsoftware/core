module PlymouthSoftware
  module Core
    module ActiveRecord
      module Priceable
        PRICE_SCALAR = 1000.00
        def has_price
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
            self.price_in_pence = value.blank? ? nil : (value.to_f * PRICE_SCALAR).to_i
          end

          def price
            return nil if price_in_pence.nil?
            self.price_in_pence.to_f / PRICE_SCALAR
          end
        end
      end
    end
  end
end
