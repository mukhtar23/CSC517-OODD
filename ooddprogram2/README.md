## Program Requirements
- Can be found in file: Program 2, Fall 2018.pdf

## User Credentials
Admin
- Name: "Admin", email: "admin@ncsu.edu", password: "ncsu rocks", role: Admin 

Realtors
- Name: "Hancheng Wu", email: "hwu99@ncsu.edu", password: "123456", role: realtor
- Name: "Realtor3", email: "realtor2@ncsu.edu", password: "123456, role: realtor

Hunter
- Name: "Hunter1", email: "hunter1@ncsu.edu", password: "123456", role: Hunter

Dual Role Account
- Name: "Realtor_Hunter", email: "realtor_hunter1@gmail.com", password: "123456 role: Hunter


## Program Functionality:

New Users
- when a new user is added to the system (either by sign up or by admin) will be added to the users table and then the corresponding table for either hunter or realtor depending on what was chosen at sign up.

To switch roles as a user:
- You sign up as a realtor or hunter first. Then you go to sign up page again and use the same email and password and select the other role. Then when you sign in, you will have access to both realtor and hunter home page for their respective functionality

To do realtor/hunter functionality as Admin:
- On the Admin user page, you will see links to both a hunter and realtor home page to do their respective functionality

To delete a user as Admin:
- you must delete a user from the realtor and/or hunter tables first, then delete from the User table.

## Setup
- Tested on Ruby 2.4.4

- Node.JS is required

- Run bundle install to install the required gems

- Run rake db:migrate to setup the database

- Setup the seed data by running rake db:seed

- Start the application by running rails server

- You can visit the app at http://localhost:3000

## Testing
- Run bundle install to install the required gems

- Run rake db:migrate RAILS_ENV=test to setup the test database

- Run bundle exec rspec to see the test reports
