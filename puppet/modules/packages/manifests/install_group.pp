# == Class: packages::install_group
#
# Makes use of the groupinstall option in yum. 
#
# === Parameters
#
# Document parameters here.
#
# [*packages*]
#  the group name of the packages to be installed. 
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
define packages::install_group ($packages = undef) {
  if ($caller_module_name == undef) {
    $mod_name = $module_name
  } else {
    $mod_name = $caller_module_name
  }

  exec { "${name}_groupinstall":
    command => "yum groupinstall ${name} -y",
    unless  => 'rpm -qa | grep X11',
    path    => ['/bin','/usr/bin'],
  }
}
