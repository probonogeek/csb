Given /^there is a brewery named "([^\"]*)" with (\d*) beer styles$/ do |brewery, num_of_styles|
  @brewery = Brewery.make( :name => brewery )
  num_of_styles.to_i.times do |n|
    @brewery.styles.make(:name => "Style #{n}")
  end
end
