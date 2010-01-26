# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_csb_session',
  :secret => '6a72e354a6508da778d508b6a1a998d0f69d5214dc8d00f74ff8b78a1d833b4d4a2dc1d876632da3e404fefd232a40e3c55df53e52ae0ff24a8e4a471f1122eb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
