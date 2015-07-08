require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup 
    @chef = Chef.new(name: "Bobby", email: "bobby@chefcity.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chef name should be present" do
    @chef.name = " "
    assert_not @chef.valid?
  end
  
  test "chef name should not be too short" do
    @chef.name = "a" * 2
    assert_not @chef.valid?
  end
  
  test "chef name should not be too long" do
    @chef.name = "a" * 41
  end
  
  test "email must be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "email must be unique" do
    @chef2 = Chef.new(name: "Robert", email: "bobby@chefcity.com")
    @chef2.email.upcase
    @chef.save
    assert_not @chef2.valid?
  end
  
  test "email validation should accept valid email address" do
    valid_addresses = %w[user@eee.com  user@example.com first.last@eee.au laurajoe@honk.com]
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid'
    end

  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@eee,com R_TDO-DS_at_eee.hello.org user@example. first,last*eee.au laura+joe@car+honk.com]
    invalid_addresses.each do |iva|
      @chef.email = iva
      assert_not @chef.valid?, "#{iva.inspect} should be invalid"
    end
  end
end
