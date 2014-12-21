require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def full_name(first_name, middle_name, last_name)
    User.new(:first_name => first_name, :middle_name => middle_name, :last_name => last_name).full_name
  end
  
  test "Full Name" do 
    assert_equal "John Smith", full_name('John', nil, 'Smith'), "without middle name" 
    assert_equal "John P Smith", full_name('John', 'P', 'Smith'), "with middle name" 
    assert_equal "John  Smith", full_name('John', '', 'Smith'), "empty middle name" 
  end
end
