Extra Credit Task implemented:
We have implemented the first extra credit task. The hunter will be notified if his inquiry is replied!


Admin

Name: "Admin", email: "admin@ncsu.edu", password: "ncsu rocks", role: Admin

 

Realtors

Name: "Hancheng Wu", email: "hwu99@ncsu.edu", password: "123456", role: realtor

Name: "Realtor3", email: "realtor2@ncsu.edu", password: "123456, role: realtor

 

Hunter

Name: "Hunter1", email: "hunter1@ncsu.edu", password: "123456", role: Hunter

 

Dual Role Account

Name: "Realtor_Hunter", email: "realtor_hunter1@gmail.com", password: "123456 role: Hunter


Program Functionality:

New User:

- when a new user is added to the system (either by sign up or by admin) will be added to the users table and then the corresponding table for either hunter or realtor depending on what was chosen at sign up.

To switch roles as a user:

- You sign up as a realtor or hunter first. Then you go to sign up page again and use the same email and password and select the other role. Then when you sign in, you will have access to both realtor and hunter home page for their respective functionality

To do realtor/hunter functionality as Admin:

- On the Admin user page, you will see links to both a hunter and realtor home page to do their respective functionality

To delete a user as Admin:

- you must delete a user from the realtor and/or hunter tables first, then delete from the User table.

Update: 10/10/18

Test for User Model and Static_Pages controller are done.

Update: 10/7/18 Now the Realtor can add a new company in his/her edit profile page. Realtor can add/view pictures to house belonging to his/her company.

Update: 10/3/18 preconfigured admin: email - admin@ncsu.edu password - ncsu rocks

Update: 9/27/18 updated revenue and size fields in Table company to string, and put regex validations on them.

Update: 9/26/18 updated fields names as suggested by Hasham add validation to all fields in Table users

Update: 9/25/18 created development database at /db/dev_db.sqlite3 created production database at /db/pro_db.sqlite3 make 'email' field in TABLE 'users' unique
