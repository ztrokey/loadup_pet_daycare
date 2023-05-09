require 'rails_helper'

describe Engines::PricingEngine do
  subject(:engine) { described_class.new(hours_requsted, animal_type) }

  let(:hours_requsted) { 1 }

  describe '#total' do
    context 'when animal type is dog' do
      let(:animal_type) { 'Dog' }

      it 'calculates the total with the dog rate' do
        expect(engine.total).to eq(30)
      end
    end

    context 'when animal type is cat' do
      let(:animal_type) { 'Cat' }

      it 'calculates the total with the dog rate' do
        expect(engine.total).to eq(25)
      end
    end
  end
end
