require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
  @category.name=" "
  assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    @categorynum2 = Category.new(name:"Sports")
    assert_not @categorynum2.valid?
  end
  test "name should be not too long" do
    @category.name = "a" * 40
    assert_not @category.valid?
  end
  test "name should not be too short" do
    @category.name = "TT"
    assert_not @category.valid?
  end

end