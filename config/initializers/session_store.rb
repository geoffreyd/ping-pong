# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ping-pong_session',
  :secret      => '542ebca6ff96c8f613ce9c0d98b4ff6f0522cd236ec9bd0e531edbf90faa1b115ff785a30d1d84b307d0c4437995d578ab34b23326035f3b2524784e3838a27c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
