# Declaring a default site definition for nodes.  Makes it easier for the purposes of this test

node default {
  # Default includes for tester machine
  include maven, users, packages, platform
  # Apply class ordering so things are installed in the correct way. 
  Class['platform'] -> Class['users'] -> Class[packages] -> Class[maven] 

}
