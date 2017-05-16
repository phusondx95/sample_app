require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
	test "invaliid signup information" do |variable|
		get signup_path
		assert_difference "User.count", 1 do
			post_via_redirect users_path, user: { name: "Foo Baz",
										 email: "foobaz@gmail.com",
										 password: "123456",
										 password_confirmation: "123456"}
		end
		assert_template "users/show"				
	end
end
