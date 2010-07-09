class ContactsController < ApplicationController
  def index
    redirect_to new_contact_path
  end

  def new
    @contact = Contact.new
  end

  def create
    contact = Contact.new(params[:contact])
    if contact.valid?
      @mail = SimpleMailer.send_message(contact)
      @mail.deliver

      # puts @mail.class   # Mail::Message

      flash[:notice] = t('contact_form.success_msg')
    else
      flash[:notice] = t('contact_form.failed_msg')
    end
    redirect_to root_url
  end

end

