# README

## Import data

`rake makeworks:import_all`

## Login with 3rd party

### Login with Fablabs.io

The App ID and Secret were generated on https://fablabs.io/oauth/applications

If it stops working, it might need to be re-created:
* Redirect URI: https://new.make.works/users/auth/fablabs/callback
* Scopes: user


## Blog content

Blog.content is the old content, from the old website.

The new content uses Action Text and stores it under Blog.content_action


## Development

* Run tests with `rails test`
* Automatic tests with `bundle exec guard`


## Users

What can each user do:
- Admins: can access /admin
- Champion: can edit everything in their Region
    - Champion is a user but belongs_to Region with a `is_champion` flag
- Normal user (logged in)
    - Submit a new (unverified) company
- Not logged in user can:
    - Only view most items


To become a 'champion' an admin needs to make you one, via the https://new.make.works/admin/user_regions interface.
