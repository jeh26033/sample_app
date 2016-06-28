require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
	def setup
		@user=users(:michael)
		@micropost= @user.microposts.build(content: "lorem ipsum")
	end

	test "should be valid" do
		assert @micropost.valid? #says the micropost should be valid
	end

	test "user id should be present" do #if the user_id is nil, test is failed.
		@micropost.user_id = nil 
		assert_not @micropost.valid?
	end

	test "content should be present" do
		@micropost.content=" "
		assert_not @micropost.valid?
	end

	test "content should be at most 140 characters" do
		@micropost.content= "a" * 141
		assert_not @micropost.valid?
	end
	
	test "order should be most recent first" do
		assert_equal microposts(:most_recent), Micropost.first
	end

end
