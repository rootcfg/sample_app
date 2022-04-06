require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: 'Mr.John', 
                     email: 'john@example.com',
                     password: "foobar",
                     password_confirmation: "foobar")
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without name' do
    @user.name = ''
    assert_not_nil @user.errors[:name], 'no validation error for name present'
  end

  test 'invalid without email' do
    @user.email = ''
    assert_not_nil @user.errors[:email]
  end

  test 'email should be valid' do
    @user.email = '222.222.www'
    assert_not_nil @user.errors[:email]
  end

  test 'email should be unique' do
    user2  = @user.dup
    @user.save
    assert_not user2.valid? 
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    @user.save
    assert_not @user.valid?
  end
   
end
