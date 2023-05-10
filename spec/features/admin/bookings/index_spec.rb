require 'rails_helper'

describe 'Admin Bookings Index Page' do
  let(:date) { Time.now }
  let!(:booking1) do
    Booking.create(first_name: 'Alpha1',
                   last_name: 'Beta1',
                   animal_name: 'Charlie1',
                   animal_type: 'Dog',
                   hours_requested: 2,
                   date_of_service: date + 1.day)
  end
  let!(:booking2) do
    Booking.create(first_name: 'Alpha2',
                   last_name: 'Beta2',
                   animal_name: 'Charlie2',
                   animal_type: 'Cat',
                   hours_requested: 2,
                   date_of_service: date + 2.day)
  end
  before do
    visit admin_bookings_path
  end

  it 'renders the id each booking' do
    expect(page).to have_content('Booking ID').twice
    expect(page).to have_content(booking1.id)
    expect(page).to have_content(booking2.id)
  end

  it 'renders the first name for each booking' do
    expect(page).to have_content('Client Name').twice
    expect(page).to have_content(booking1.first_name)
    expect(page).to have_content(booking2.first_name)
  end

  it 'renders the last name for each booking' do
    expect(page).to have_content(booking1.last_name)
    expect(page).to have_content(booking2.last_name)
  end

  it 'renders the pet name for each booking' do
    expect(page).to have_content('Pet Name').twice
    expect(page).to have_content(booking1.animal_name)
    expect(page).to have_content(booking2.animal_name)
  end

  it 'renders the animal type for each booking' do
    expect(page).to have_content('Animal Type').twice
    expect(page).to have_content(booking1.animal_type)
    expect(page).to have_content(booking2.animal_type)
  end

  it 'renders the hours requested for each booking' do
    expect(page).to have_content('Hours Requested').twice
    expect(page).to have_content(booking1.hours_requested)
    expect(page).to have_content(booking2.hours_requested)
  end

  it 'renders the date requested for each booking' do
    expect(page).to have_content('Date Requested').twice
    expect(page).to have_content(booking1.date_of_service)
    expect(page).to have_content(booking2.date_of_service)
  end

  it 'renders the total price for each booking' do
    expect(page).to have_content('Total Price').twice
    expect(page).to have_content(booking1.total_price)
    expect(page).to have_content(booking2.total_price)
  end
end
