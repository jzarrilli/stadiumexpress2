
require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "order_received" do
    mail = Notifier.order_received(orders(:one))
    assert_equal "Stadium Express Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Philly Cheesesteak/, mail.body.encoded
  end

  test "order_shipped" do
    mail = Notifier.order_shipped(orders(:one))
    assert_equal "Stadium Express Order Ready", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Philly Cheesesteak<\/td>/,
      mail.body.encoded
  end

end
