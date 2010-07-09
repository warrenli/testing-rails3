Given /^(?:|I )I choose (.+)$/ do |language_name|
  visit path_to(language_name)
end

