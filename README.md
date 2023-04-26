# Drupal on Codespaces

## Quickstart
* Open this project in Codespaces (google it if you still don't know how)
* When it starts run `sh setup.sh`
* When it asks for:
  * `Database name [drupal]:` just hit enter
  * `Database driver [mysql]:` write `sqlite` and hit enter (it doesn't support mysql)
  * `Database username [drupal]:` hit enter
  * `Database password [drupal]:` hit enter
  * `Database host [127.0.0.1]:` hit enter
  * `Database port [3306]:` just hit enter
  * `Do you want to continue? (yes/no) [yes]:` hit enter
* When it finishes run `cd drupal_site` and then `drush serve`

## Notes:
* after `drush serve` there is a popup asking you if you want to open the site in the browser
* admin login is admin/123
* if you close the tab with the site you can find the url in the "ports" tab under the "Local Address" and click it
* if you come back after some days - just start the codespaces again, go to the drupal_site folter and run `drush serve` again
