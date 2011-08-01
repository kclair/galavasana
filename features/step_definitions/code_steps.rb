Given /^I have a code snippet "([^"]*)"$/ do |snippet|
end

When /I fill in the textarea with "([^"]*)"$/ do |snippet|
  When 'I fill in "code[snippet]" with "'+snippet+'"'
end
