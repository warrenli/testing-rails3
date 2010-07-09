# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SimpleMailer do
#  include EmailSpec::Helpers
#  include EmailSpec::Matchers

  before(:all) do
    valid_attributes = {
      :sender_name      => "陳大文",
      :sender_email     => "abc@example.com",
      :recipient_name   => "李小明",
      :recipient_email  => "xyz@example.com",
      :subject          => "你好嗎",
      :message          => "好久不見，你好嗎?"
    }
    contact = Contact.new(valid_attributes)
    @email = SimpleMailer.send_message(contact)

    #puts "***"
    #puts @email.inspect
    #puts "***"
  end

  subject { @email }

  it { @email.should be_instance_of(Mail::Message) }
  it { @email.should deliver_to("xyz@example.com") }
  it { @email.should have_subject(/你好嗎/) }
  it { @email.should have_body_text(/好久不見，你好嗎?/) }

end

