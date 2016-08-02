require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "signup_confirmation" do
    mail = UserMailer.signup_confirmation
    assert_equal "Signup confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "new_grade" do
    mail = UserMailer.new_grade
    assert_equal "New grade", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "edit_grade" do
    mail = UserMailer.edit_grade
    assert_equal "Edit grade", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "new_task" do
    mail = UserMailer.new_task
    assert_equal "New task", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
