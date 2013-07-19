# == Class: packages::install_local
#
# Full description of class packages here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { packages:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
define packages::install_local ($packages = undef) {
  if ($caller_module_name == undef) {
    $mod_name = $module_name
  } else {
    $mod_name = $caller_module_name
  }

  package { $name:
    ensure   => present,
    provider => rpm,
    source   => "https://dl.dropboxusercontent.com/u/22810565/${name}.rpm",
  }
}
