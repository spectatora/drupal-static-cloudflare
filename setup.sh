composer create-project drupal/recommended-project drupal_site
cd drupal_site
composer require drush/drush
vendor/bin/drush si --db-url=sqlite://drupal:drupal@127.0.0.1:3306/drupal
vendor/bin/drush upwd admin 123
vendor/bin/drush generate phpstorm-metadata
