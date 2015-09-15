require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

=begin

  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

=end

  test "should get home" do
    get :home
    assert_response :success
    #assert_select "title", "Home | #{@base_title}"
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    get :help
    assert_response :success
    #assert_select "title", "Help | #{@base_title}"
    assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
  end

  test "should get about" do
    get :about
    assert_response :success
    #assert_select "title", "About | #{@base_title}"
    assert_select "title", "About | Ruby on Rails Tutorial Sample App"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | Ruby on Rails Tutorial Sample App"
  end


end