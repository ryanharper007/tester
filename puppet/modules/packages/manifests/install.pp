# == Class: packages::install
#
# This is a custom define to install a package/array of packages.
#
# === Parameters
#
# Document parameters here.
#
# [*packages*]
#   the array of packages that you would like to install.
#
# === Variables
# === Examples
# === Authors
#
# Ryan Harper <ryanharper007@mydomain.com>
#
# === Copyright
#
# Copyright 2013 Ryan Harper, unless otherwise noted.
#
define packages::install ($packages = undef) {
  if ($caller_module_name == undef) {
    $mod_name = $module_name
  } else {
    $mod_name = $caller_module_name
  }

  package { $name: ensure => present, }
}
