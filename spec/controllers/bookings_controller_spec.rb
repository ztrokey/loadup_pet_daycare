require 'rails_helper'

describe BookingsController do
  describe '#create' do
    context 'when vaild params are passed in' do
      it 'redirects to the new booking url' do
        params = { first_name: 'first', last_name: 'last', animal_name: 'fluffy',
                   animal_type: 'Dog', hours_requested: '2', date_of_service: '2023-05-10' }
        post :create, params: { booking: params }

        expect(response).to redirect_to(new_booking_url)
        expect(Booking.count).to eq(1)
      end
    end

    context 'when invaild params are passed in' do
      it 'does not save the booking' do
        params = { first_name: '', last_name: 'last', animal_name: 'fluffy',
                   animal_type: 'Dog', hours_requested: '2', date_of_service: '2023-05-10' }
        post :create, params: { booking: params }

        expect(Booking.count).to eq(0)
      end
    end
  end
end
