# Drupal on Codespaces

## Quickstart
* Open this project in Codespaces (google it if you still don't know how)
* When it starts run `sh setup.sh`
* When it finishes run `cd drupal_site` and then `drush serve`
* open the "ports" tab (right next to the terminal) and use the link under the "Local Address" to open your drupal instance
* admin login is
  * ACC: admin
  * PASS: 123

## Note (AFTER YOU START AND VISIT THE DRUPAL INSTANCE):
* Once you enter your instance as shown on the lectures, copy the DOMAIN of the Drupal instance, it should end with `.preview.app.github.dev`.
* Go to `drupal_site/web/index.php`
* Find the line that has this code `$request = Request::createFromGlobals();`
* Put this code RIGHT ABOVE it: `$_SERVER['HTTP_HOST'] = '***-***-***-***-***.preview.app.github.dev';`
* Replace the contents of this line value with your Drupal instance domain. Add the DOMAIN ONLY. No trailing slash and no protocol.
* Save the file. Now Drupal should work find and not redirect you to "localhost". If it starts redirecting you to "localhost", fix the domain in the `index.php` again.
* If you don't know what the domain is - watch the web fundamentals lectures again.

## Note:
* if you come back after some days - just start the codespaces again, go to the `drupal_site` folder, run `drush serve` again and in the `ports` tab follow the link to access your site 

* NOTE: if "drush" doesn't work - use "vendor/bin/drush" instead. Example: `vendor/bin/drush serve` (inside the drupal_site folder).