module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /the admin index page/
      '/admin'

    when /the new batch page/
      '/admin/batches/new'

    when /the show page for the new batch/
#       "/admin/batches/#{Batch.last.id}"
      admin_batch_path( Batch.last )

    when /the (.*?) show page/
      admin_style_path( Style.find_by_brewery_style_label($1))


    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
