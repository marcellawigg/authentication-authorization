require "test_helper"

class AdminCategoryTest < ActionDispatch::IntegrationTest

  test "logged in admin sees categories index" do

    #create admin user
    admin = User.create(username: "ajcarmer", password: "password", role: 1)
    #stub out the login process
    ApplicationController.any_instance.stubs(:current_user).returns( admin )
    #go to the category index
    visit admin_categories_path
    #make sure we can see info that tells us we're on the right page
    within("#page_title") do
      assert page.has_content?("All Categories")
    end
  end

  test "default user does not see admin categories index" do
    user = User.create(username: "ajcarmer", password: "password", role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_categories_path

    refute page.has_content?("All Categories")
    assert page.has_content?("The page you were looking for doesn't exist (404)")
    
  end
end
