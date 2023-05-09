require 'rails_helper'

describe Booking, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:animal_name) }
    it { should validate_inclusion_of(:animal_type).in_array(%w[Dog Cat]) }
    it { should validate_inclusion_of(:hours_requested).in_array((2..8).to_a) }
    it { should validate_presence_of(:date_of_service) }
  end

  describe '#date_of_service_in_future' do
    subject(:booking) do
      Booking.new(first_name: 'first', last_name: 'last', animal_name: 'fluffy',
                  animal_type: 'Dog', hours_requested: 2, date_of_service: date)
    end

    context 'when date_of_service is today' do
      let(:date) { Time.now }

      it 'is valid' do
        expect(booking).to(be_valid)
      end
    end

    context 'when date_of_service is greater than today' do
      let(:date) { Time.now + 1.day }

      it 'is valid' do
        expect(booking).to(be_valid)
      end
    end

    context 'when date_of_service is less than today' do
      let(:date) { Time.now - 1.day }

      it 'is valid' do
        expect(booking).to_not(be_valid)
      end
    end
  end
end
