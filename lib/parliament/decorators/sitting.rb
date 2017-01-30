module Parliament
  module Decorators
    module Sitting
      def houses
        respond_to?(:sittingHasHouse) ? sittingHasHouse : []
      end

      # def literals_hash
      #   hash = {
      #       type: type,
      #       sittingStartDate: sittingStartDate
      #   }
      #
      #   respond_to?(:sittingEndDate) ? hash[:sittingEndDate] = sittingEndDate : hash
      # end

      def literals_hash
        hash = {}
        instance_variables.each do |attribute|
          value = instance_variable_get(attribute)
          attribute = attribute.to_s.tr!('@', '').to_sym
          unless value.is_a? Array
            hash[attribute] = value
          end
        end
        hash
      end
    end
  end
end
