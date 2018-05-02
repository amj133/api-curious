# ApiCurious

This project focuses on consuming data from the public GitHub API in an attempt to replicate the profile page of any GitHub user that logs in to the application.  User login occurs using OAuth protcol to authenticate users with the third-party provider, in this case GitHub.  As a student, a critical component of this project was using various testing techniques to allow for testing against the third-party data.  To achieve this, VCR and webmock were used to efficiently test the third-party data at the service or unit level, and stubbing of the data for dependent feature and integration tests.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

1.  Clone down this project and change into the directory
```
git clone https://github.com/amj133/api-curious.git
bundle install
```
2.  Create and migrate the database
```
rake db:create
rake db:migrate
```
3.  Run rails server and visit localhost:3000 in your browser
```
rails s
```
*visit http://localhost:3000 in your browser *enjoy!

### Prerequisites

Ruby 2.4+
Rails 5

Running the tests
To run the tests, follow the instructions in Getting Started above first. Open rails server in a separate tab then run rspec.
```
rspec
```
##### Our tests include:
* feature tests for logging in using OmniAuth
* request tests of all API request endpoints
* VCR recording of service tests for expedient future testing
* Webmock stubbing of service requests for integration test
* model tests of all ActiveRecord and PORO models
* service tests of all PORO services

##### Tools and gems used for testing:

* [VCR] (https://github.com/vcr/vcr)
* [webmock] (https://github.com/bblimke/webmock)
* [capybara](https://github.com/teamcapybara/capybara)
* [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)

Author
Andrew Jeffery
