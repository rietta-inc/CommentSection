require 'rails_helper'

RSpec.describe 'Home Page Marketing Content', type: :system do
  it 'homepage has the title expected by marketing' do
    visit '/'
    expect(page).to have_text 'Welcome to the Comments Section'
  end

  it 'requires e-mail in e-mail field' do
    visit root_path
    fill_in 'E-mail', with: 'bob'
    click_on 'Subscribe'
    validation_message = page.find('#_signup_email').native.attribute("validationMessage")
    expect(validation_message).to have_text "Please include an '@' in the email address."
  end
end