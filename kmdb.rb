# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Movie.destroy_all
Studio.destroy_all
Actor.destroy_all
Role.destroy_all
Rails.logger.info 

# Generate models and tables, according to the domain model.
# TODO!
#Done using | rails generate model 'Name' method
#Migrated using | rails db:migrate

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#_____SUDIO_____
warner_bros = Studio.new
warner_bros ["name"] = "Warner Bros"
warner_bros.save

#_____MOVIE_____
batman_begins = Movie.new
batman_begins ["title"] = "Batman Begins"
batman_begins ["year_released"] = 2005
batman_begins ["rated"] = "PG-13"
batman_begins ["studio_id"] = warner_bros["id"]
batman_begins.save

dark_knight = Movie.new
dark_knight ["title"] = "The Dark Knight"
dark_knight ["year_released"] = 2008
dark_knight ["rated"] = "PG-13"
dark_knight ["studio_id"] = warner_bros["id"]
dark_knight.save

dark_knight_rises = Movie.new
dark_knight_rises ["title"] = "The Dark Knight Rises"
dark_knight_rises ["year_released"] = 2012
dark_knight_rises ["rated"] = "PG-13"
dark_knight_rises ["studio_id"] = warner_bros["id"]
dark_knight_rises.save

#_____ACTOR_____
#1
christian_bale = Actor.new
christian_bale ["name"] = "Christian Bale"
christian_bale.save
#2
michael_caine = Actor.new
michael_caine ["name"] = "Michael Caine"
michael_caine.save
#3
liam_neeson = Actor.new
liam_neeson ["name"] = "Liam Neeson"
liam_neeson.save
#4
katie_holmes = Actor.new
katie_holmes ["name"] = "Katie Holmes"
katie_holmes.save
#5
gary_oldman = Actor.new
gary_oldman ["name"] = "Gary Oldman"
gary_oldman.save
#6
heath_ledger = Actor.new
heath_ledger ["name"] = "Heath Ledger"
heath_ledger.save
#7
aaron_eckhart = Actor.new
aaron_eckhart ["name"] = "Aaron Eckhart"
aaron_eckhart.save
#8
maggie_gyllenhaal = Actor.new
maggie_gyllenhaal ["name"] = "Maggie Gyllenhaal"
maggie_gyllenhaal.save
#9
tom_hardy = Actor.new
tom_hardy ["name"] = "Tom Hardy"
tom_hardy.save
#10
joseph_gl = Actor.new
joseph_gl ["name"] = "Joseph Gordon-Levitt"
joseph_gl.save
#11
anne_hathaway = Actor.new
anne_hathaway ["name"] = "Anne Hathaway"
anne_hathaway.save

#_____ROLE_____
bruce_wayne1 = Role.new
bruce_wayne1 ["movie_id"] = batman_begins["id"]
bruce_wayne1 ["actor_id"] = christian_bale["id"]
bruce_wayne1 ["character_name"] = "Bruce Wayne"
bruce_wayne1.save

bruce_wayne2 = Role.new
bruce_wayne2 ["movie_id"] = dark_knight["id"]
bruce_wayne2 ["actor_id"] = christian_bale["id"]
bruce_wayne2 ["character_name"] = "Bruce Wayne"
bruce_wayne2.save

bruce_wayne3 = Role.new
bruce_wayne3 ["movie_id"] = dark_knight_rises["id"]
bruce_wayne3 ["actor_id"] = christian_bale["id"]
bruce_wayne3 ["character_name"] = "Bruce Wayne"
bruce_wayne3.save

alfred1 = Role.new
alfred1 ["movie_id"] = batman_begins["id"]
alfred1 ["actor_id"] = michael_caine["id"]
alfred1 ["character_name"] = "Alfred"
alfred1.save

alfred2 = Role.new
alfred2 ["movie_id"] = dark_knight["id"]
alfred2 ["actor_id"] = michael_caine["id"]
alfred2 ["character_name"] = "Alfred"
alfred2.save

ras = Role.new
ras ["movie_id"] = batman_begins["id"]
ras ["actor_id"] = liam_neeson["id"]
ras ["character_name"] = "Ra's Al Ghul"
ras.save

rachel1 = Role.new
rachel1 ["movie_id"] = batman_begins["id"]
rachel1 ["actor_id"] = katie_holmes["id"]
rachel1 ["character_name"] = "Rachel Dawes"
rachel1.save

rachel2 = Role.new
rachel2 ["movie_id"] = dark_knight["id"]
rachel2 ["actor_id"] = maggie_gyllenhaal["id"]
rachel2 ["character_name"] = "Rachel Dawes"
rachel2.save

comiss1 = Role.new
comiss1 ["movie_id"] = batman_begins["id"]
comiss1 ["actor_id"] = gary_oldman["id"]
comiss1 ["character_name"] = "Commissioner Gordon"
comiss1.save

comiss2 = Role.new
comiss2 ["movie_id"] = dark_knight_rises["id"]
comiss2 ["actor_id"] = gary_oldman["id"]
comiss2 ["character_name"] = "Commissioner Gordon"
comiss2.save

joker = Role.new
joker ["movie_id"] = dark_knight["id"]
joker ["actor_id"] = heath_ledger["id"]
joker ["character_name"] = "Joker"
joker.save

harvey = Role.new
harvey ["movie_id"] = dark_knight["id"]
harvey ["actor_id"] = aaron_eckhart["id"]
harvey ["character_name"] = "Harvey Dent"
harvey.save

bane = Role.new
bane ["movie_id"] = dark_knight_rises["id"]
bane ["actor_id"] = tom_hardy["id"]
bane ["character_name"] = "Bane"
bane.save

robin = Role.new
robin ["movie_id"] = dark_knight_rises["id"]
robin ["actor_id"] = joseph_gl["id"]
robin ["character_name"] = "John Blake"
robin.save

catwoman = Role.new
catwoman ["movie_id"] = dark_knight_rises["id"]
catwoman ["actor_id"] = anne_hathaway["id"]
catwoman ["character_name"] = "Selina Kyle"
catwoman.save

# Query the movies data and loop through the results to display the movies output.
# TODO!
# Prints a header for the movies output
puts "Movies"
puts "======"
for movie in Movie.all
     studio_name = Studio.where({ "id" => movie["studio_id"] })
        for studio in studio_name
           studio = studio["name"]
        end
    puts "#{movie["title"]} #{movie["year_released"]} #{movie["rated"]} #{studio}"
end

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"