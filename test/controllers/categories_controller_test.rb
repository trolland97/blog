require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should not save category without name" do
    cat = Category.new
    assert_not cat.save, "Saved the category without a name"
  end
  
end
