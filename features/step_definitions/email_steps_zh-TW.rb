# encoding: utf-8

那麼 /^"([^"]*)"應該收到 (\d+) 封電子郵件標題是"([^"]*)"$/ do |address, amount, subject|
  unread_emails_for(address).select { |m| m.subject.force_encoding("utf-8") =~ Regexp.new(subject.force_encoding("utf-8")) }.size.should == parse_email_count(amount)
end

當 /^"([^"]*)"閱讀標題為"([^"]*)"的電子郵件$/ do |address, subject|
  open_email(address, :with_subject => subject)
end

那麼 /^在電子郵件裡中應該寫着"([^"]*)"$/ do |text|
  current_email.default_part_body.to_s.should include(text)
end

那麼 /^"([^"]*)"不會收到封電子郵件$/ do |address|
  unread_emails_for(address).size.should == parse_email_count(0)
end

