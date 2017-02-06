require_relative '../../spec_helper'

describe Parliament::Decorators::Party do
  let(:data) { StringIO.new(File.read('spec/fixtures/parties_current.nt')) }
  let(:objects) { Grom::Reader.new(data).objects }
  let(:party_node) { objects.first }

  describe '#name' do
    context 'Grom::Node has all the required objects' do
      it 'confirms that the type for this Grom::Node object is Party' do
        expect(party_node.type).to eq('http://id.ukpds.org/schema/Party')
      end

      it 'returns the name of the party for the Grom::Mode object' do
        party_node.extend(Parliament::Decorators::Party)
        expect(party_node.name).to eq('Labour')
      end
    end
  end
end
