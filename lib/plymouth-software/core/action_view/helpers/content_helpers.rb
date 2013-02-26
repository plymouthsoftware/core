module PlymouthSoftware
  module Core
    module ActionView
      module Helpers
        module ContentHelpers
          include InstanceMethods

          module InstanceMethods
            # Return a +:page_title+ content block with 
            # the given +title+, or the supplied
            # block.
            #
            # Usage:
            #   page_title "Hello World"
            #
            #   page_title do
            #     h2 Hello World
            #     # ...
            #   end
            #
            #   yield :page_title
            #   => <h2>Hello World</h2>
            def page_title(title = nil &block)
              content_for :page_title do
                if block_given?
                  yield
                else
                  title
                end
              end
            end
          end
        end
      end
    end
  end
end
