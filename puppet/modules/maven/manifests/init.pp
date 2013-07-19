# Copyright 2011 MaestroDev
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Class: maven
#
# A puppet recipe for Apache Maven, to download artifacts
# from a Maven repository
#
# It uses Apache Maven command line to download the artifacts.
#
# Parameters:
#   - $version:
#         Maven version.
#
# Requires:
#   Java package installed.
#
# Sample Usage:
#   class {'maven':
#     version => "3.0.5",
#   }
#

class maven() {
  # Install Maven
$central = {
    id => "myrepo",
    username => "",
    password => "",
    url => "http://repo.maven.apache.org/maven2",
    mirrorof => "external:*",      # if you want to use the repo as a mirror, see maven::settings below
  }

$proxy = {
    active => false, #Defaults to true
    protocol => 'http', #Defaults to 'http'
    host => 'http://proxy.acme.com',
    username => 'myuser', #Optional if proxy does not require
    password => 'mypassword', #Optional if proxy does not require
    nonProxyHosts => 'www.acme.com', #Optional, provides exceptions to the proxy
  }

  class { "maven::maven":
    version => "3.0.5", # version to install
    # you can get Maven tarball from a Maven repository instead than from Apache servers, optionally with a user/password
    repo => {
      url => "http://repo.maven.apache.org/maven2",
      #username => "",
      #password => "",
    },
#    user                 => "tester",  # if you want to run it as a different user (defaults to root), will create it if not defined
#    #maven_opts           => "",      # anything to add to MAVEN_OPTS in ~/.mavenrc
#    #maven_path_additions => "",      # anything to add to the PATH in ~/.mavenrc
  } ->

  # Create a settings.xml with the repo credentials
  maven::settings { 'maven-user-settings' :
    mirrors => [$central], # mirrors entry in settings.xml, uses id, url, mirrorof from the hash passed
    servers => [$central], # servers entry in settings.xml, uses id, username, password from the hash passed
    proxies => [$proxy], # proxies entry in settings.xml, active, protocol, host, username, password, nonProxyHosts
 #   user    => 'tester',
  }

}


