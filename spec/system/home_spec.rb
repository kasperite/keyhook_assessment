require 'rails_helper'

RSpec.describe 'Home page', type: :system do
  it 'displays the home page' do
    create(:listing, title: 'Big House for rent')
    visit root_path
    expect(page).to have_content('Houses for rent')
    expect(page).to have_content('Big House for rent')
    expect(page).to have_link('Book a Viewing')
  end
end