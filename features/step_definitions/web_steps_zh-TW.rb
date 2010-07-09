# encoding: utf-8

require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

假設 /^(?:|我)來到(.+)$/ do |page_name|
  visit path_to(page_name)
end

當 /^(?:|我)瀏覽(.+)$/ do |page_name|
  visit path_to(page_name)
end

當 /^(?:|我)在"([^\"]*)"欄位中輸入"([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

當 /^(?:|我)按下了"([^\"]*)"按钮$/ do |button|
  click_button(button)
end

那麼 /^(?:|我)停留在(.+)$/ do |page_name|
  URI.parse(current_url).path.should == path_to(page_name)
end

那麼 /^(?:|我)應該看到"([^\"]*)"的提示信息$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

