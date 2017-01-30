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

      def literals_hash
        {
            type: type,
            forename: forename,
            surname: surname
        }
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
