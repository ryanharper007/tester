# == Class: packages
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
class packages (
  $package_present = 'present',
  $remote_packages = ['git'],
  $local_packages  = ['jdk-7u25-linux-x64'],
  $group_install   = [
    'Desktop']) {
  # Validate parameters

  if ($package_present == undef) {
    fail('package_present parameter must be set')
  }

  if ($remote_packages == undef) {
    fail('please define the packages you want installed')
  }

  packages::install { $remote_packages: }

  packages::install_local { $local_packages: }

  packages::install_group { $group_install: }
}

