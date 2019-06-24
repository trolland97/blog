require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should not save comment without name" do
    c = Comment.new :comment => 'szoveg'
    assert_not c.save, "Saved the comment without a name"
  end

  test "should not save comment without content" do
    c = Comment.new :name => 'szoveg'
    assert_not c.save, "Saved the comment without content""
  end

  test "should not save an empty comment" do
    c = Comment.new
    assert_not c.save, "Saved an empty comment"
  end

  test "should save a proper comment" do
    c = Comment.new :comment => 'szoveg', :name => 'szoveg'
    assert c.save, "Didnt save the proper comment"
end
