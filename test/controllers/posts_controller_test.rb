require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should not save post without title" do
    user = User.new :email => "asd@asd.com"
    p = Post.new :content => 'szoveg', user_id => user.id
    assert_not p.save, "Saved the post without a title"
  end

  test "should not save post without content" do
    user = User.new :email => "asd@asd.com"
    p = Post.new :title => 'szoveg', user_id => user.id
    assert_not p.save, "Saved the post without content""
  end

  test "should not save an empty post" do
    p = Post.new
    assert_not p.save, "Saved an empty post"
  end

  test "should save a proper post" do
    user = User.new :email => "asd@asd.com"
    p = Post.new :title => 'szoveg', user_id => user.id, :content => 'szoveg'
    assert p.save, "Didnt save the proper post"
end
