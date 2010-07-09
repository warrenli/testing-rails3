class SimpleMailer < ActionMailer::Base
  default :from => "from@example.com",
          :bcc => 'info@dontrush.org'

  def send_message(contact)
    @contact = contact

    mail :to => "#{@contact.recipient_name} <#{@contact.recipient_email}>", :subject => "#{@contact.subject}", :reply_to => "#{@contact.sender_name} <#{@contact.sender_email}>"
  end
end

