# == Class: packages::install_local
#
# installs an rpm from a local source.
#
# === Parameters
#
# Document parameters here.
#
# [*packages*]
#  the name of the packages you would like to install from a local source.
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
define packages::install_local ($packages = undef) {
  if ($caller_module_name == undef) {
    $mod_name = $module_name
  } else {
    $mod_name = $caller_module_name
  }

  file { "/tmp/${name}.rpm":
    ensure => present,
    source => "puppet:///modules/packages/${name}.rpm",
  } ->

  package { $name:
    ensure   => present,
    provider => rpm,
    source   => "/tmp/${name}.rpm",
  }
}
