# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Contact do

  it { should allow_mass_assignment_of(:sender_name) }
  it { should allow_mass_assignment_of(:sender_email) }
  it { should allow_mass_assignment_of(:recipient_name) }
  it { should allow_mass_assignment_of(:recipient_email) }
  it { should allow_mass_assignment_of(:subject) }
  it { should allow_mass_assignment_of(:message) }

  it { should validate_presence_of(:sender_name) }
  it { should validate_presence_of(:sender_email) }
  it { should validate_presence_of(:recipient_name) }
  it { should validate_presence_of(:recipient_email) }
  it { should validate_presence_of(:subject) }
  it { should validate_presence_of(:message) }

  it { should ensure_length_of(:message).is_at_most(200) }

  context "when create new record" do
    before(:each) do
      @valid_attributes = {
        :sender_name      => "陳大文",
        :sender_email     => "abc@example.com",
        :recipient_name   => "李小明",
        :recipient_email  => "xyz@example.com",
        :subject          => "你好嗎",
        :message          => "好久不見，你好嗎?"
      }
      @invalid_attributes = {
        :sender_name      => "陳大文",
        :sender_email     => "abc@example",
        :recipient_name   => "李小明",
        :recipient_email  => "xyz@example.com",
        :subject          => "你好嗎",
        :message          => "好久不見，你好嗎?"
      }
    end

    it "should create a new instance given valid attributes" do
      contact = Contact.new(@valid_attributes)
      contact.valid?.should be true
      contact.save.should be true
    end

    it "should create a invalid instance given invalid attributes" do
      contact = Contact.new(@invalid_attributes)
      contact.valid?.should be false
      contact.save.should be false
    end

  end
end

