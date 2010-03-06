When /^I select the (\w+) style$/i do |style_index|
  value = @brewery.styles.__send__(style_index).label
  select(value, :from => "Style")
end

Given /^"([^\"]*)" has (\d+) batches$/i do |brewery_style_label,number_of_styles|
  style = Style.find_by_brewery_style_label( brewery_style_label )

  number_of_styles.to_i.times do |n|
    style.batches.make( :brewed_at => "0#{n+1}/03/2010", :ready_at => "0#{n+1}/04/2010" )
  end
end

Then /^I should see the brewed_at date for all batches of (.*)$/i do |brewery_style_label|
  style = Style.find_by_brewery_style_label( brewery_style_label )

  style.batches.each do |batch|
    assert page.has_css?("a[href='#{admin_batch_path( batch )}']")
  end
end
