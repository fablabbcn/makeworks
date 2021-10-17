[MakeWorks](https://make.works/) is a platform that helps you find nearby manufacturers

## Technology and development

- Web framework: Ruby on Rails
- Database: Postgresql
- Hosting: Heroku
- Assets hosting: AWS

Staging web server:
- http://staging.make.works/
- https://staging-makeworks.herokuapp.com/

### Development

* Run tests with `rails test`
* Run system tests with `rails test:system`
* Automatic tests with `bundle exec guard`
* If you need ENV vars you can do: `cp env.example .env`

#### Import data

`rake makeworks:import_all`

- TODO:
- Get the API key to Login with linkedin
- A region can use a 'can_signup' flag to control if companies can be submitted to their region?

#### Login with Fablabs.io

The App ID and Secret were generated on https://fablabs.io/oauth/applications

If it stops working, it might need to be re-created:
* Redirect URI: https://new.make.works/users/auth/fablabs/callback
* Scopes: user

#### Blog content

Blog.content is the old content, from the old website.

The new content uses Action Text and stores it under Blog.content_action

## Regions and permissions

- Companies can belong to 0, 1 or multiple regions.
- If a company belongs to 1 hidden region, and 1 visible region, the company will be visible.
- If a company is in no region, it will be visible.
- If the company is not verified, it will be hidden.

## Users and permissions

What can each user do:

### Admins
- Can access /admin dashboard
- Edit everything

### Champion
- Can edit everything in their Region
- Champion is a user but belongs_to Region with a `is_champion` flag

### Normal user (logged in)
- Submit a new (unverified) company

### Not logged in user
- Only view most items

### Company Employee roles
Company owner can edit his company and invite other users into the company

When a user creates a company, he becomes an employee and the owner.

There are 3 roles:
- Owners: can edit everything and give other employees access.
- Managers: can edit but not add new employees.
- Normal: nothing?


To become a 'champion' an admin needs to make you one, via the https://new.make.works/admin/user_regions interface.

Edit manufacturering tags in a not verified listing as an admin by deleting /admin/ out of listing URL to enter front end editor.  

## TODO consideration

Images:
* Should all users be able to upload as many images as possible?
* What if a bot / random user signs up and uploads 500 pictures?
* Only Verified can upload images?

Below is the 'OLD way' of adding images.
* It Uploaded images to Amazon S3 via plugin? (how / where)?
* Each image has a column in the database.
* There was a limit of 9 images. (To add more we have to create a new database column)
* Ideally we should MERGE the 'old' way into the 'new' way
* The old way took 1 image 'original' and created multiple sizes, 1200px, 940px etc
* Then a front end script was used to replace the URL, changing /1200px/ to /940px/ when needed.
* If more information is needed, it might be possible to contact Jamie who worked on the original web
