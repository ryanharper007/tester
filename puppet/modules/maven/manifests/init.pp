# Class: maven
#
# The Apache Maven module allows Puppet to install maven and update the bashrc file to include maven in the path.
#
# Parameters: ensure, source, deploymentdir, user, pathfile
#
# Sample Usage:
#    maven::setup { "example.com-maven":
#      ensure        => 'present',
#      source        => 'apache-maven-3.0.5-bin.tar.gz',
#      deploymentdir => '/home/tester/apps/apache-maven',
#      user          => 'testing',
#      pathfile      => '/home/tester/.bashrc'
#    }


class maven {
  maven::setup { "tester-maven":
    ensure        => 'present',
    source        => 'apache-maven-3.0.3.tar.gz',
    deploymentdir => '/home/tester/apache-maven',
    user          => 'tester',
    pathfile      => '/home/tester/.bashrc'
  }
}
