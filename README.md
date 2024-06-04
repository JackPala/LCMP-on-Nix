# LCMP-on-Nix
Importable NixOS configuration for Caddy with SQL and PHP-FPM - easily deploy native Wordpress with Nix

## What does this software do?
This software is a single Nix / NixOS module that deploys Caddy with PHP-FPM under the www-data user, and a blank MariaDB SQL Server

The goal of this software was to streamline the deployment of Wordpress, Drupal, or any PHP-FPM compatible app instance, without needing to use full NixOS Wordpress services. This module lets you deploy the base server so that you can put any PHP-FPM application in the folder, define the hostname, and it should "just work"
