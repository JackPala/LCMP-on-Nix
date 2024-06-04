{ config, pkgs, ... }:

{
  # Caddy Webserver with PHP-FPM
  services.caddy = {
    enable = true;
    user = "www-data";
    group = "www-data";
    virtualHosts."example.com" = {
    extraConfig = ''
      root    * /var/www/example
      file_server
      php_fastcgi unix/var/run/phpfpm/caddy.sock
    '';
    };
  };
  # Ensure required webserver ports are open
  networking.firewall.allowedTCPPorts = [ 80 443];

  # MariaDB SQL
  services.mysql = {
  enable = true;
  package = pkgs.mariadb;
  };

  # PHP packages
  environment.systemPackages = with pkgs; [
    php81
  ];

  # PHP-FPM on required socketpath
  services.phpfpm.pools = {
  caddy = {
    phpPackage = pkgs.php81;
    user = "www-data";
    group = "www-data";
    settings = {
      "pm" = "dynamic";
      "pm.max_children" = 75;
      "pm.start_servers" = 10;
      "pm.min_spare_servers" = 5;
      "pm.max_spare_servers" = 20;
      "pm.max_requests" = 500;
    };
   };
  };

 # Create required user for PHP-FPM and Caddy
 users.users.www-data = {
  isSystemUser = true;
  home = "/var/lib/caddy";
  createHome = false;
  description = "System user for web services";
  group = "www-data";
  extraGroups = [ "root" ];
 };

 # Create the required group for PHP-FPM and Caddy
 users.groups.www-data = {};

}
