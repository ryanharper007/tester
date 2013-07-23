tester
======

### This is a vagrant environment for test purposes only.

The following assumptions are made with regards to the deployment
* You have virtual box installed and configured. 
* You will be using vagrant to deploy the vms. 
* The domain is <b>example.com</b>
* Puppet client will be run, and not a puppet master.
* You will be using virtual box as the default provider.  This can quite easily be expanded to other providers, but is not in the scope of this project. 
* All hiera data values are found in the hiera data folder under the relative folder of puppet/hiera.  
* Vagrant version used is 1.2.4.
* Centos 6.4 x86_64.
* Puppet version is puppet 3.1.1 

To get the environment up and running on your machine please run the following commands. 

<i>1. Clone the repository to a folder somewhere on your filesystem.</i>
<pre>
 git clone https://github.com/ryanharper007/tester.git
</pre>
<i>2. Change directory to the newley created clone.</i>
<pre>
 cd tester
</pre>
<i>3. Start up the vagrant environment.</i>
<pre>
 vagrant up
</pre>
<i>4. The vm will go into runlevel 5 once the install and config is completed. you can then access this box either through the console or through ssh.</i>
<pre>
 vagrant ssh
</pre>
<i>5. Maven settings are deployed through puppet.  To test maven is working please carry out the following somewhere on your filesystem.</i>
<pre>
 sudo su - tester
 git clone https://github.com/sit/java-build-test.git
</pre>
<i>6. Change directory to this clone.</i>
<pre>
 cd java-build-test
</pre>
<i>7. Check that you can build the java project.</i>
<pre>
 mvn clean install
</pre>

The second part of the test includes the roman conversion utility in java. This gets deployed as an rpm to the machine, and has a shell wrapper, this is deployed to the machine but the project itself can be built by following the instructions below.

<i>1. Go in as the tester user, with the relevant password.</i>
<pre>
 sudo su - tester
</pre>
<i>2. Clone the java project.</i>
<pre>
 git clone https://github.com/ryanharper007/tester.git
</pre>
<i>3. Change directory to the java directory in the project root.</i>
<pre>
 cd tester/java/roman-numerals-1.3
</pre>
<i>4. Build the java project, this will generate all the relevant artefacts.</i>
<pre>
 mvn clean install
 <b>refer to the logs where the rpm is created. The usual place for this is.</b>
 /home/tester/tester/java/roman-numerals-1.3/target/rpm/roman-numerals/RPMS/noarch/roman-numerals-1.3-1.noarch.rpm
</pre>
<i>5. As root you can reinstall the rpm if you wish.</i>
<pre>
 su - root (password is vagrant)
 rpm -ivh /home/tester/tester/java/roman-numerals-1.3/target/rpm/roman-numerals/RPMS/noarch/roman-numerals-1.3-1.noarch.rpm --force
</pre>
<i>6. To test roman conversion application please issue the following commands.</i>
<pre>
 e.g. roman-conv 555
 should return 555 in Roman numerals: DLV
</pre>

That should be it. Happy testing!!
