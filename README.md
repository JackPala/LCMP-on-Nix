# LCMP-on-Nix
Importable NixOS configuration for Caddy with SQL and PHP-FPM - easily deploy native Wordpress with Nix

## What does this software do?
This software is a single Nix / NixOS module that deploys Caddy with PHP-FPM under the www-data user, and a blank MariaDB SQL Server

The goal of this software was to streamline the deployment of Wordpress, Drupal, or any PHP-FPM compatible app instance, without needing to use full NixOS Wordpress services. This module lets you deploy the base server so that you can put any PHP-FPM application in the folder, define the hostname, and it should "just work"

This software has been tested with Wordpress, and it works as intended as long as the wordpress folder permissions are set correctly. This will allow you to import your existing Wordpress sites into your NixOS server with minimal wrestling with expressions. **Note that although the config use's nixOS's immutability, the Wordpress base files need to be manually put in the directory that you specifiy in the NixOS file** This is by design, as it lets you very easily and quickly switch from something like Ubuntu Server to NixOS for hosting your sites.

**Note: I am not responsible for anything that you choose do with it, and this file is MIT Licensed** - but if you find any bugs or issues feel free to open a ticket!

## How do I deploy this on my NixOS / Nix Server?

There are a number of ways you can add this to your NixOS / Nix server. Namely:

1. Copy & Paste the content of LCMP.nix into your configuration.nix
2. Import LCMP.nix into your Nix file directory (usually /etc/nixos) and add it to your list of imports like so:

   ```
   imports = [
    ./hardware-configuration.nix
    ./LCMP.nix
    # Other imported .nix files go here
    ];
   ```
Once you have the file imported as intended thru your preferred method, you will need to set the following values:

1. Your Virtualhost URL - This is set as example.com inside of LCMP.nix but you will need to set it to your website or webapp's URL so Caddy can setup automatic SSL
2. Your files directory - This is set as /var/www/example but you will need to set it to your website or webapps files folder. For wordpress, this would be the location of your wordpress install - the directory where your wp-config.php files and whatnot usually live.

Note, you can add as many virtualhosts as you'd like, by adding them to the caddy section. NixOS's official wiki has good instructions on that [here](https://nixos.wiki/wiki/Caddy)

## Post deployment instructions

You will need to create whatever database you require for your webapp, you can do this as root with `mysql -u root -p` and then hit enter (make sure to set your mysql password for security)

You will also need to set your webapp folder's and file permissions appropiately depending on what it is (Wordpress, Drupal, etc), this is outside of the scope of this file but there are plenty of scripts online that handle this for your specific use case.





