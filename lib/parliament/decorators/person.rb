require 'active_support/concern'
require 'active_model/serialization'
require 'active_model/serializers/json'

module Parliament
  module Decorators
    module Person
      extend ActiveModel::Serializers
      def houses
        respond_to?(:personHasSitting) ? personHasSitting.first.sittingHasHouse : []
      end

      def sittings
        respond_to?(:personHasSitting) ? personHasSitting : []
      end

      def as_json
        super(except: ['personHasSitting', 'personHasPartyMembership', 'statements'])
      end
    end
  end
end
