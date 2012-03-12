require 'test_helper'

class EstimatesTest < ActionMailer::TestCase
  test "send_to_contact" do
    mail = Estimates.send_to_contact
    assert_equal "Send to contact", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
