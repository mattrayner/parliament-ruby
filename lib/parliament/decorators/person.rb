require 'json'

module Parliament
  module Decorators
    module Person
      def houses
        respond_to?(:personHasSitting) ? personHasSitting.first.sittingHasHouse : []
      end

      def sittings
        respond_to?(:personHasSitting) ? personHasSitting : []
      end

      # def literals_hash
      #   {
      #       type: type,
      #       forename: forename,
      #       surname: surname
      #   }
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

      def to_hash
        person_hash = self.literals_hash

        if respond_to?(:personHasSitting)
          sittings = personHasSitting.map { |sitting| sitting.literals_hash }
          person_hash[:personHasSitting] = sittings
        end

        person_hash
      end
    end
  end
end
