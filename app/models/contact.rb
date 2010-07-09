class Contact < ActiveRecord::Base
  def self.columns() @columns ||= []; end

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  def save(validate = true)
     validate ? valid? : true
  end

  column :sender_name,      :string
  column :sender_email,     :string
  column :recipient_name,   :string
  column :recipient_email,  :string
  column :subject,          :string
  column :message,          :string

  attr_accessor :sender_name, :sender_email, :recipient_name, :recipient_email, :subject, :message

  validates_presence_of :sender_name, :sender_email, :recipient_name, :recipient_email, :subject, :message
  validates_format_of :sender_email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}/i
  validates_format_of :recipient_email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}/i
  validates_length_of :message, :maximum => 200

end

