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
# Ryan Harper <ryanharper@domain.com>
#
# === Copyright
#
# Copyright 2013 Ryan Harper, unless otherwise noted.
#
class users ( $user_name = '', $present_value = '', $manage_home_value = '', $uid_value = '', $user_pass = '', $user_comment = '' ) {
  user { $user_name:
    ensure => $present_value,
    managehome => $manage_home_value,
    uid => $uid_value,
    password => $user_pass,
    comment  => $user_comment,
  }
}
