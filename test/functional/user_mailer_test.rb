require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def test_welcome_email
    user = "aris"
 
    # Send the email, then test that it got queued
    email = UserMailer.welcome_email(user).deliver
    assert !ActionMailer::Base.deliveries.empty?
 
    # Test the body of the sent email contains what we expect it to
    assert_equal [user.email], email.to
    assert_equal "Subjeknya Aris bisa buat reminder baru", email.subject
    assert_match(/<h1>Welcome to MyRemainder.com, #{user}<\/h1>/, email.encoded)
    assert_match(/Welcome to MyRemainder.com, #{user}/, email.encoded)
  end
end
