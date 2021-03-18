Specifications for the Sinatra Assessment
Specs:
- [x] Use Sinatra to build the app
    # used corneal gem to get basic scaffolding for web app
- [x] Use ActiveRecord for storing information in a database
    # created an Espresso model which is mapped to an espressos table at the database
    # created a User model which is mapped to a users table at the databse
- [x] Include more than one model class (e.g. User, Post, Category)
     # Two models- user and espresso
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    # user has_many espressos
- [x] ] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    # espresso belongs_to user
- [x] Include user accounts with unique login attribute (username or email)
    # unique login attribute - email 
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    # espresso resource has routes for creating, reading, updating and destroying
- [x] Ensure that users can't modify content created by other users
    # users will only see and modify their own content
- [x] Include user input validations
    # name, email, and password are validated
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message