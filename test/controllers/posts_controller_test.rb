require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "should get index" do
    get posts_path
    assert_response :success
  end

  test "should get new when signed in" do
    sign_in users(:one)

    get new_post_path
    assert_response :success
  end

  test "should create post when signed in" do
    sign_in users(:one)

    assert_difference("Post.count") do
      post posts_path, params: {
        post: {
          body: "Test post"
        }
      }
    end

    assert_redirected_to posts_path
  end
end