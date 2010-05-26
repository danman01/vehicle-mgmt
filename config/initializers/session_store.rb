# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_truckapp3_session',
  :secret      => '91e09217f6594d1b75cfae105573054213a2b6554cf6525d9c732566ff191d8387bb6359d94a1d5b8c85d8fb240fab0c8fce8b1936d1844c61d68c9d2e23cb46'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
