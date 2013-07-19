# == Class: users
#
# Full description of class users here.
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
#  class { users:
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
class users {

  user { 'tester':
    ensure => present,
    managehome => true,
    uid => 1000,
    password => '$6$ZFlkyIcv$y0gM1hnH.SC0TVJX2AQPQCTA.7Mo8.MWvwS0ZRd9Kjq6xspTyCYJ4bAADEIwYbMeoEFMbl3NjjwUEK.caXxbD0',
    comment  => 'Visa test user',
  }
}
