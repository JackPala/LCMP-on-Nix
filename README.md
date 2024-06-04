# LCMP-on-Nix
Importable NixOS configuration for Caddy with SQL and PHP-FPM - easily deploy native Wordpress with Nix

## What does this software do?
This software is a single Nix / NixOS module that deploys Caddy with PHP-FPM under the www-data user, and a blank MariaDB SQL Server

The goal of this software was to streamline the deployment of Wordpress, Drupal, or any PHP-FPM compatible app instance, without needing to use full NixOS Wordpress services. This module lets you deploy the base server so that you can put any PHP-FPM application in the folder, define the hostname, and it should "just work"

This software has been tested with Wordpress, and it works as intended as long as the wordpress folder permissions are set correctly. This will allow you to import your existing Wordpress sites into your NixOS server with minimal wrestling with expressions. **Note that although the config use's nixOS's immutability, the Wordpress base files need to be manually put in the directory that you specifiy in the NixOS file** This is by design, as it lets you very easily and quickly switch from something like Ubuntu Server to NixOS for hosting your sites.

**Note: I am not responsible for anything that you choose do with it, and this file is MIT Licensed** - but if you find any bugs or issues feel free to open a ticket!

## How do I deploy this on my NixOS / Nix Server?
