ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"
require 'database_cleaner'

#Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, with: :threads)
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  DatabaseCleaner.start
  DatabaseCleaner.clean
  fixtures :all

  #Проверка залогинен ли пользователь
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Add more helper methods to be used by all tests here...
end
