require 'test_helper'

class JobPostsControllerTest < ActionController::TestCase
  setup do
    @job_post = job_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_post" do
    assert_difference('JobPost.count') do
      post :create, job_post: { city: @job_post.city, company_name: @job_post.company_name, company_url: @job_post.company_url, contact_email: @job_post.contact_email, country: @job_post.country, job_description: @job_post.job_description, job_position: @job_post.job_position }
    end

    assert_redirected_to job_post_path(assigns(:job_post))
  end

  test "should show job_post" do
    get :show, id: @job_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_post
    assert_response :success
  end

  test "should update job_post" do
    put :update, id: @job_post, job_post: { city: @job_post.city, company_name: @job_post.company_name, company_url: @job_post.company_url, contact_email: @job_post.contact_email, country: @job_post.country, job_description: @job_post.job_description, job_position: @job_post.job_position }
    assert_redirected_to job_post_path(assigns(:job_post))
  end

  test "should destroy job_post" do
    assert_difference('JobPost.count', -1) do
      delete :destroy, id: @job_post
    end

    assert_redirected_to job_posts_path
  end
end
