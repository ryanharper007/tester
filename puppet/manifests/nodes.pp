node default {
  include maven, users
  
  Class['users'] -> Class[maven]
  
#  maven::setup { "example.com-maven":
#    ensure        => 'present',
#    source        => 'apache-maven-3.0.5-bin.tar.gz',
#    deploymentdir => '/home/example.com/apps/apache-maven',
#    user          => 'tester',
#    pathfile      => '/home/example.com/.bashrc'

}
