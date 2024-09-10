# Drupal on Codespaces

## Quickstart
* Open this project in CodeSpaces (google it if you still don't know how)
* When it starts run `sh setup.sh`
* When it finishes run `cd drupal_site`
* Run `./vendor/bin/drush serve`
* Open the "ports" tab (right next to the terminal) and use the link under the "Local Address" to open your Drupal instance
* admin login is
  * ACC: admin
  * PASS: 123

## Note:
* if you come back after some days - start the codespaces again, go to the `drupal_site` folder, run `drush serve` again, and in the `ports` tab follow the link to access your site 

* NOTE: if "drush" doesn't work - use "./vendor/bin/drush" instead. Example: `./vendor/bin/drush serve` (inside the drupal_site folder).

## Sync with Cloudflare Pages
* Once static generation is finished
```phpt
CLOUDFLARE_ACCOUNT_ID=[ACCOUNT_ID] CLOUDFLARE_API_TOKEN=[API_TOKEN] npx wrangler pages publish drupal_site/html --project-name=[PROJECT_NAME]
```
