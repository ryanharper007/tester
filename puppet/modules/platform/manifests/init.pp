# == Class: platform
#
# Ensures certain base settings are applied. .
#
# === Parameters
#
# Document parameters here.
#
# [*default_run_level*]
#   The default run level you wish to run your host/vm under#
# === Variables
# === Authors
#
# Ryan Harper <ryanharper007@mydomain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class platform ( $default_run_level = '5'){
  # Making sure the default run level is set to 5
  file { '/etc/inittab':
    ensure => present,
    content => template('platform/inittab.erb'),
  }
}
