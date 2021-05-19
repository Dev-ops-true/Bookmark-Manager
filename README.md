# Project Title
## Rock, Paper, Scissors, Lizard, Spock

# User Stories

As a user<br>
So that i can see the webistes I regularly visit<br>
I want to be able to see a list of bookmarks

|            Object               |            Method               |
|:-------------------------------:|:-------------------------------:|
|            User                 |                                 |
|            Bookmarks            |          .all_bookmarks         |
<img src="./public/readme_images/diag1.png" width="50%">

As a time-pressed user<br>
So that I can save a website<br>
I would like to add the site's address and title to bookmark manager

|            Object               |            Method               |
|:-------------------------------:|:-------------------------------:|
|            User                 |                                 |
|            Bookmarks            |          .add_bookmarks         |
<img src="./public/readme_images/diag3.png" width="50%">
<img src="./public/readme_images/diagram.png" width="50%">



## Motivation



## Build status
Data base is created
New entries can be added to the data base

## Code style


## Tech/framework used
VS Code
GitHub

## Built with
Ruby
Postgres
Rspec

## Installation

### Setting Up a PostgreSQL Database

* Connect to psql
* Create the database using the psql command CREATE DATABASE bookmark_manager;
* Connect to the database using the pqsl command \c bookmark_manager;
* Run the query we have saved in the file 01_create_bookmarks_table.sql

## Tests
Rspec has been set up to mock a few entries into the database if the ENV is set to 'test'
Feature tests are implemented to test the above

## Screenshots

<img src="./public/images/" width="50%">
<img src="./public/images/" width="50%">

## How to use?


## Credits
* Dewald Viljoen
* JP Ferreira

