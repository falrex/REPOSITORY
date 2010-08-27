# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_RubyQuiz_session',
  :secret      => 'aeec8e5d15e8691546faf4ffce16038f536899f2dd7388f08318e0491851c954e09be3221fd4ba0915f4fac1f43ae96a2a92699407c07fe0cee731048eaff374'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
