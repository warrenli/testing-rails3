# encoding: utf-8

假設 /^(?:|I )選用 (.+)$/ do |language_name|
  visit path_to(language_name)
end

