Given /^there is an account with login "([^\"]*)"$/ do |username|
  params = {
    :username => username,
    :email => "moonshine@example.com",
    :password => "password",
    :password_confirmation => "password"
  }
  @user = User.create!( params )
end

Given /^I am logged in as "([^\"]*)"$/ do |username|
  fill_in('Username', :with => username )
  fill_in('Password', :with => "password" )
  click_button("Log In")
end
