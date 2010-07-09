# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContactsController do

  describe "GET index" do
    it "access the default action" do
      get :index
      response.should redirect_to(new_contact_path)
    end
  end

  describe "GET new" do
    it "assigns a new contact as @contact" do
      get :new
      response.should be_success
      response.should render_template("new")
      assigns(:contact).should_not be_nil
    end
  end

  describe "POST create" do

    describe "with valid params" do
      before(:each) do
        @params = {
                :sender_name      => "陳大文",
                :sender_email     => "abc@example.com",
                :recipient_name   => "李小明",
                :recipient_email  => "xyz@example.com",
                :subject          => "你好嗎",
                :message          => "好久不見，你好嗎?"
        }
        post :create, :contact => @params
      end

        #Contact.should_receive(:new)
        #Mail::Message.should_receive(:deliver)
        #SimpleMailer.should_receive(:send_message)

      it { assigns(:mail).should_not be_nil }
      it { assigns(:mail).should be_instance_of(Mail::Message) }
      it { flash[:notice].should == I18n.t('contact_form.success_msg') }
      it { response.should redirect_to(root_url) }

    end

    describe "with invalid params" do
      before(:each) do
        @params = {
                :sender_name      => "陳大文",
                :sender_email     => "abc@example.com",
                :recipient_name   => "李小明",
                :recipient_email  => "xyz@example",
                :subject          => "你好嗎",
                :message          => "好久不見，你好嗎?"
        }
        post :create, :contact => @params
      end

        #SimpleMailer.should_not_receive(:send_message)

      it { assigns(:mail).should be_nil }
      it { flash[:notice].should == I18n.t('contact_form.failed_msg') }
      it { response.should redirect_to(root_url) }

    end

  end

end

