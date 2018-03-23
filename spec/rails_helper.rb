# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'support/factory_bot'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.ignore_request do |request|
    request.uri == "https://api.github.com/login/oauth/authorize"
  end
  config.cassette_library_dir = "spec/fixtures/cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('<GITHUB_API_KEY>') { ENV['GITHUB_TEST_ENVIRONMENT_ACCESS_TOKEN']}
end

def get_stub(filename, uri, headers = {})
  json_response = File.open("./spec/fixtures/#{filename}.json")
  stub_request(:get, "https://api.github.com/#{uri}")
    .to_return(status: 200, body: json_response, headers: {})
end

def monkey_man_test_stubs
  repo_uri = "users/monkey-man/repos?page=1"
  get_stub("user_repos", repo_uri)

  repo_uri = "users/monkey-man/repos"
  get_stub("user_repos", repo_uri)

  follower_uri = "users/monkey-man/followers"
  get_stub("user_followers", follower_uri)

  following_uri = "users/monkey-man/following"
  get_stub("user_following", following_uri)

  starred_uri = "users/monkey-man/starred"
  get_stub("user_starred", starred_uri)

  date_limit = (Date.today - 14).strftime('%Y-%m-%d')

  recent_commits_uri = "search/commits?q=author-date:>#{date_limit} author:monkey-man"
  get_stub("user_recent_commits", recent_commits_uri)

  follower_1_commits_uri = "search/commits?q=author-date:>#{date_limit} author:mgmilton"
  get_stub("user_follower_1_commits", follower_1_commits_uri)

  follower_2_commits_uri = "search/commits?q=author-date:>#{date_limit} author:lnchambers"
  get_stub("user_follower_1_commits", follower_2_commits_uri)
end

# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end
