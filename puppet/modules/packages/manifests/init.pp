# == Class: packages
#
# installs a group of packages based on certain parameters.
#
# === Parameters
#
# Document parameters here.
#
# [*package_present*]
#   whether the package should be installed or not.
# [*remote_packages*]
#   remote packages from remote repos i.e. yum.puppetlabs.com
# [*local_packages*]
#  installation of local rpms.
# [*group_install*]
#   group install a particular group of packages, uses the yum groupinstall option.
#
# === Variables
#
# === Examples
#
#  class { packages:
#    $package_present => present,
#    $remote_packages => ['git'],
#    $local_packages  => ['jdk'],
#  }
#
# === Authors
#
# Ryan Harper <ryanharper007@mydomain.com>
#
# === Copyright
#
# Copyright 2013 Ryan Harper, unless otherwise noted.
#
class packages (
  $package_present = 'present',
  $remote_packages = ['git'],
  $local_packages  = ['jdk-1.7.0_25-fcs.x86_64'],
  $group_install   = ['Desktop']
) {
  # Validate parameters

  if ($package_present == undef) {
    fail('package_present parameter must be set')
  }

  if ($remote_packages == undef) {
    fail('please define the packages you want installed')
  }

  # This will go off and do the various package installs.
  packages::install { $remote_packages: }
  packages::install_local { $local_packages: }
  packages::install_group { $group_install: }
}

