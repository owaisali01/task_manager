# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
TaskManager::Application.config.secret_key_base = '27f05272ccfba0afb2bbff68efd6bec1a318d0b8bdf84fa9b71dbd598a4a81b36ce8278ea0f7bd5ef05c651292c2a3cc9dff9b8f1ac951cb3c39d896250ac91c'
