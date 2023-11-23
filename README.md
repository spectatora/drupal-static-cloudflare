# Drupal on Codespaces

## Quickstart
* Open this project in CodeSpaces (google it if you still don't know how)
* When it starts run `sh setup.sh`
* When it finishes run `cd drupal_site`
* Edit `web/sites/default/settings.php` and add the following code to it
```phpt
$settings["reverse_proxy"] = TRUE;
$settings["reverse_proxy_addresses"] = ["127.0.0.1"];
```
* Run `drush serve`
* open the "ports" tab (right next to the terminal) and use the link under the "Local Address" to open your drupal instance
* admin login is
  * ACC: admin
  * PASS: 123

## Static generation
* Alter composer.json with the following
```json
{
    "name": "drupal/recommended-project",
    "description": "Project template for Drupal projects with a relocated document root",
    "type": "project",
    "license": "GPL-2.0-or-later",
    "homepage": "https://www.drupal.org/project/drupal",
    "support": {
        "docs": "https://www.drupal.org/docs/user_guide/en/index.html",
        "chat": "https://www.drupal.org/node/314178"
    },
    "repositories": [
        {
            "type": "composer",
            "url": "https://packages.drupal.org/8"
        }
    ],
    "require": {
        "composer/installers": "^2.0",
        "drupal/core-composer-scaffold": "^10.1",
        "drupal/core-project-message": "^10.1",
        "drupal/core-recommended": "^10.1",
        "drush/drush": "^12.4",
        "drupal/tome": "^1.11"
    },
    "conflict": {
        "drupal/drupal": "*"
    },
    "minimum-stability": "stable",
    "prefer-stable": true,
    "config": {
        "allow-plugins": {
            "composer/installers": true,
            "drupal/core-composer-scaffold": true,
            "drupal/core-project-message": true,
            "phpstan/extension-installer": true,
            "dealerdirect/phpcodesniffer-composer-installer": true
        },
        "sort-packages": true
    },
    "extra": {
        "drupal-scaffold": {
            "locations": {
                "web-root": "web/"
            }
        },
        "installer-paths": {
            "web/core": [
                "type:drupal-core"
            ],
            "web/libraries/{$name}": [
                "type:drupal-library"
            ],
            "web/modules/contrib/{$name}": [
                "type:drupal-module"
            ],
            "web/profiles/contrib/{$name}": [
                "type:drupal-profile"
            ],
            "web/themes/contrib/{$name}": [
                "type:drupal-theme"
            ],
            "drush/Commands/contrib/{$name}": [
                "type:drupal-drush"
            ],
            "web/modules/custom/{$name}": [
                "type:drupal-custom-module"
            ],
            "web/profiles/custom/{$name}": [
                "type:drupal-custom-profile"
            ],
            "web/themes/custom/{$name}": [
                "type:drupal-custom-theme"
            ]
        },
        "drupal-core-project-message": {
            "include-keys": [
                "homepage",
                "support"
            ],
            "post-create-project-cmd-message": [
                "<bg=blue;fg=white>                                                         </>",
                "<bg=blue;fg=white>  Congratulations, you’ve installed the Drupal codebase  </>",
                "<bg=blue;fg=white>  from the drupal/recommended-project template!          </>",
                "<bg=blue;fg=white>                                                         </>",
                "",
                "<bg=yellow;fg=black>Next steps</>:",
                "  * Install the site: https://www.drupal.org/docs/installing-drupal",
                "  * Read the user guide: https://www.drupal.org/docs/user_guide/en/index.html",
                "  * Get support: https://www.drupal.org/support",
                "  * Get involved with the Drupal community:",
                "      https://www.drupal.org/getting-involved",
                "  * Remove the plugin that prints this message:",
                "      composer remove drupal/core-project-message"
            ]
        },
        "enable-patching": "true",
        "patches": {
            "drupal/tome": {
                "Tome not working with Drush 12": "https://www.drupal.org/files/issues/2023-08-02/tome_drush12-support.patch"
            }
        }
    }
}
```
**Note**: We are adding `"drupal/tome": "^1.11"` module and then applying a patch for it 
```json
"drupal/tome": {
    "Tome not working with Drush 12": "https://www.drupal.org/files/issues/2023-08-02/tome_drush12-support.patch"
}
```
## Note:
* if you come back after some days - just start the codespaces again, go to the `drupal_site` folder, run `drush serve` again and in the `ports` tab follow the link to access your site 

* NOTE: if "drush" doesn't work - use "vendor/bin/drush" instead. Example: `vendor/bin/drush serve` (inside the drupal_site folder).

## Sync with Cloudflare Pages
* Once static generation is finished
```phpt
CLOUDFLARE_ACCOUNT_ID=[ACCOUNT_ID] CLOUDFLARE_API_TOKEN=[API_TOKEN] npx wrangler pages publish drupal_site/html --project-name=[PROJECT_NAME]
```
