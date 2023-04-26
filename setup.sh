composer create-project drupal/recommended-project drupal_site
cd drupal_site
composer require drush/drush
drush si
drush upwd admin 123
drush generate phpstorm-metadata
