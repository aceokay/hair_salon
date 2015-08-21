require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("The hair salon homepage paths", {:type => :feature}) do
  it('allows a user to add a new Stylist') do
    visit('/')
    fill_in('stylist_name', :with => 'Richard Sherman')
    click_button('Add Stylist')
    expect(page).to have_content('Richard Sherman')
  end

  it('allows a user to add a new Client only if there are Stylists to add them to') do
    visit('/')
    expect(page).not_to have_content('Name of new client:')
    fill_in('stylist_name', :with => 'Richard Sherman')
    click_button('Add Stylist')
    fill_in('client_name', :with => 'Cam Chancellor')
    click_button('Add Client')
    expect(page).to have_content('Cam Chancellor')
  end

  it('allows a user to delete a Client from the client page') do
    visit('/')
    fill_in('stylist_name', :with => 'Richard Sherman')
    click_button('Add Stylist')
    fill_in('client_name', :with => 'Cam Chancellor')
    click_button('Add Client')
    click_link('Cam Chancellor')
    click_button('Delete Client')
    expect(page).not_to have_content('Cam Chancellor')
  end

  it('allows a user to delete a Stylist from the Stylist page, also deleting the clients of that Stylist') do
    visit('/')
    fill_in('stylist_name', :with => 'Richard Sherman')
    click_button('Add Stylist')
    fill_in('client_name', :with => 'Cam Chancellor')
    click_button('Add Client')
    click_link('Richard Sherman')
    click_button('Delete Stylist')
    expect(page).not_to have_content('Cam Chancellor')
    expect(page).not_to have_content('Richard Sherman')
  end

  it('allows a user to update a Client from the Slient page') do
    visit('/')
    fill_in('stylist_name', :with => 'Richard Sherman')
    click_button('Add Stylist')
    fill_in('client_name', :with => 'Cam Chancellor')
    click_button('Add Client')
    click_link('Cam Chancellor')
    fill_in('name', :with => 'Bam Bam')
    click_button('Update')
    expect(page).not_to have_content('Cam Chancellor')
    expect(page).to have_content('Bam Bam')
  end

  it('allows a user to update a Stylist from the Stylist page') do
    visit('/')
    fill_in('stylist_name', :with => 'Richard Sherman')
    click_button('Add Stylist')
    fill_in('client_name', :with => 'Cam Chancellor')
    click_button('Add Client')
    click_link('Richard Sherman')
    fill_in('name', :with => 'Tim Tam')
    click_button('Update')
    expect(page).not_to have_content('Richard Sherman')
    expect(page).to have_content('Tim Tam')
  end
end
