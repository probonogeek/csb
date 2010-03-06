When /^I select the (\w+) style$/ do |style_index|
  value = @brewery.styles.__send__(style_index).label
  select(value, :from => "Style")
end




