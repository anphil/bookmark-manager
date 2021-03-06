require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @tag = tags(:one)    
    @request.env["devise.mapping"] = Devise.mappings[:user]
    fg_user = FactoryGirl.create(:user)
    fg_user.confirm
    sign_in fg_user

    @user_profile = FactoryGirl.create(:user_profile, user_id: fg_user.id)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag" do
    assert_difference('Tag.count') do
      post :create, tag: { color: @tag.color, title: @tag.title }
    end

    assert_redirected_to tag_path(assigns(:tag))
  end

  test "should show tag" do
    get :show, id: @tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tag
    assert_response :success
  end

  test "should update tag" do
    patch :update, id: @tag, tag: { color: @tag.color, title: @tag.title }
    assert_redirected_to tag_path(assigns(:tag))
  end

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete :destroy, id: @tag
    end

    assert_redirected_to tags_path
  end
end
