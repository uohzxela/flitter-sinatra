flitter-sinatra
===============

Microblog created with Ruby Sinatra framework

Run 'bundle install' before running 'ruby main.rb'

Access the app at http://localhost:3000/

Features implemented:

1. User should be able to “create new post”, with 2 fields: “username” and “Post”
2. The “Post” should limited to 200 characters or less
3. The message should not be saved if “username” or “Post” is empty, “username” should be more than 3 characters and contains no space
4. User should be able to edit any post
5. User should be able to delete post
6. All posts are public. User can see a list of all posts at http://localhost:3000/
7. Posts by same username should be visible at http://localhost:3000/username


Future work:

1. Add in meaningful comments to the code

2. Change development database from sqlite3 to postgreSQL, deploy to Heroku

3. Implement pagination

4. Implement login and user database
