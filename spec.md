# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app -- Sinatra gem was added to the project's gemfile, to handle routes, templating and actions.
- [x] Use ActiveRecord for storing information in a database -- Both ActiveRecord and sqlite3 gems were added to the project's gemfile. The macros I used were: has_many, belongs_to and has_many through.
- [x] Include more than one model class (e.g. User, Post, Category) -- user, trail, category and trail_category
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) -- a user :has_many trails and a trail :has_many categories
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) -- a trail belongs_ to a user
- [x] Include user accounts with unique login attribute (username or email) -- username and password
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
- [x] Ensure that users can't modify content created by other users -- User controller only allows current_user to modify its own content by checking its session user id before making any changes.
- [x] Include user input validations --  The user name and password must match for the user to login. And the user is warned and re-routed if any invalid data is present.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) -- sinatra-flash gem is added to the gemfile. And shows error messages when users enter invalid date or not enough data.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message