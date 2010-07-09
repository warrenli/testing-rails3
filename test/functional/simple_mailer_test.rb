require 'test_helper'

class SimpleMailerTest < ActionMailer::TestCase
  test "send_message" do
    contact = Contact.new(
        :sender_name => "Peter",
        :sender_email => "peter@example.com",
        :recipient_name => "John",
        :recipient_email => "john@example.com",
        :subject => "Send message",
        :message => "Hi")
    mail = SimpleMailer.send_message(contact)
    assert_equal "Send message", mail.subject
    assert_equal ["john@example.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

