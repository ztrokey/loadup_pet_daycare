require 'rails_helper'

describe 'creating a booking', type: :feature do
  scenario 'with valid inputs' do
    date = (Time.now + 1.day).strftime('%Y/%m/%d')
    visit new_booking_path
    fill_in 'booking[first_name]',	with: 'First'
    fill_in 'booking[last_name]',	with: 'last'
    fill_in 'booking[animal_name]',	with: 'Fluffy'
    fill_in 'booking[date_of_service]', with: date
    click_on 'Create Booking'

    expect(Booking.count).to eq(1)
  end

  scenario 'with invalid first name' do
    date = (Time.now + 1.day).strftime('%Y/%m/%d')
    visit new_booking_path
    fill_in 'booking[last_name]',	with: 'last'
    fill_in 'booking[animal_name]',	with: 'Fluffy'
    fill_in 'booking[date_of_service]', with: date
    click_on 'Create Booking'

    expect(page).to have_content("First name can't be blank")
  end

  scenario 'with invalid last name' do
    date = (Time.now + 1.day).strftime('%Y/%m/%d')
    visit new_booking_path
    fill_in 'booking[first_name]',	with: 'first'
    fill_in 'booking[animal_name]',	with: 'Fluffy'
    fill_in 'booking[date_of_service]', with: date
    click_on 'Create Booking'

    expect(page).to have_content("Last name can't be blank")
  end

  scenario 'with invalid pet name' do
    date = (Time.now + 1.day).strftime('%Y/%m/%d')
    visit new_booking_path
    fill_in 'booking[first_name]',	with: 'first'
    fill_in 'booking[last_name]',	with: 'last'
    fill_in 'booking[date_of_service]', with: date
    click_on 'Create Booking'

    expect(page).to have_content("Animal name can't be blank")
  end

  scenario 'with invalid date of service' do
    date = (Time.now - 1.day).strftime('%Y/%m/%d')
    visit new_booking_path
    fill_in 'booking[first_name]',	with: 'First'
    fill_in 'booking[last_name]',	with: 'last'
    fill_in 'booking[animal_name]',	with: 'Fluffy'
    fill_in 'booking[date_of_service]', with: date
    click_on 'Create Booking'

    expect(page).to have_content("Date of service can't be in the past")
  end
end
