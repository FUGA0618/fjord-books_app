# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  module SignInHelper
    def sign_in_as(user)
      visit root_url
      within 'form' do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
      end
    end
  end

  class ActionDispatch::SystemTestCase
    include SignInHelper
  end

  include FactoryBot::Syntax::Methods
end
