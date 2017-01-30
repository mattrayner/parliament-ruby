module Parliament
  module Decorators
    module Sitting
      def houses
        respond_to?(:sittingHasHouse) ? sittingHasHouse : []
      end

      def literals_hash
        hash = {
            type: type,
            sittingStartDate: sittingStartDate
        }

        respond_to?(:sittingEndDate) ? hash[:sittingEndDate] = sittingEndDate : hash
      end
    end
  end
end
