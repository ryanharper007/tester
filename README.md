tester
======

### This is a vagrant environment for test purposes only. 

The following assumptions are made with regards to the deployment
* you have virtual box installed and configured. 
* you will be using vagrant to deploy the vms. 
* the domain is example.com
* puppet client will be run, and not a puppet master.
* you will be using virtual box as the default provider.  This can quite easily be expanded to other providers, but is not in the scope of this project. 
* all hiera data values are found in the hiera data folder under the relative folder of puppet/hiera.  
* Vagrant version used is 1.2.4
* Centos 6.4 x86_64  box is used. 

To get the environment up and running on your machine please run the following commands. 

1. Clone the repository to a folder somewhere on your filesystem. 
<pre>
 : git clone https://github.com/ryanharper007/tester.git
</pre>
2. Change directory to the newley created clone. 
<pre>
 : cd tester
</pre>
3. Start up the vagrant environment
<pre>
  : vagrant up  
</pre>
4. The vm will go into runlevel 5 once the install and config is completed. you can then access this box either through the console or through ssh
<pre>
  : vagrant ssh
</pre>
5. Maven settings are deployed through puppet.  To test maven is working please carry out the following somewhere on your filesystem. 
<pre> 
  : git clone https://github.com/sit/java-build-test.git
</pre>
6. Change directory to this clone
<pre>
  : cd java-build-test
</pre>
7. Check that you can build the java project. 
<pre>
  : mvn clean install
</pre>

The second part of the test includes the roman conversion utility in java. This gets deployed as an rpm to the machine, and has a shell wrapper, this is deployed to the machine but the project itself can be built by following the instructions below.
<pre>
1. go in as the tester user, with the relevant password.
</pre>
<pre>
2. clone the java project
 : git clone https://github.com/ryanharper007/tester.git
</pre>
<pre>
3. change directory to the java directory in the project root
 : cd tester/java/roman-numerals-1.3
</pre>
<pre>
4. mvn clean install, refer to the logs where the rpm is installed. The usual place for this is.  
 : /home/tester/tester/java/roman-numerals-1.3/target/rpm/roman-numerals/RPMS/noarch/roman-numerals-1.3-1.noarch.rpm
</pre>
<pre>
5. as root you can reinstall the rpm if you wish. 
 : rpm -ivh /home/tester/tester/java/roman-numerals-1.3/target/rpm/roman-numerals/RPMS/noarch/roman-numerals-1.3-1.noarch.rpm --force
</pre>
<pre>
To test roman conversion application please issue the following command.
: e.g. roman-conv 555
: should return 555 in Roman numerals: DLV


That should be it. Happy testing!!
