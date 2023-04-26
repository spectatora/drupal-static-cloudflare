# Drupal on Codespaces

## Quickstart

* Open this project in Codespaces
* Open the terminal
* Create a Drupal project: `composer create-project drupal/recommended-project <myfolder>`
* Enter the created folder: `cd <myfolder>`
* Add Drush: `composer require drush/drush`
* Start the Drupal installation: `drush si` - specify **sqlite** as Database driver, defaults otherwise!
* Optional: Change the admin password: `drush upwd admin <password>`
* Optional: Generate initial support for services code completion (see below): `drush generate phpstorm-metadata`
* Run the development server: `drush serve`
