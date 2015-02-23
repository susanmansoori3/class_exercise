require 'test_helper'

class ResponseMailerTest < ActionMailer::TestCase
  test "send_response" do
    mail = ResponseMailer.send_response
    assert_equal "Send response", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
