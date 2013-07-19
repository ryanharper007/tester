tester
======

### This is a vagrant environment for test purposes only. 

The following assumptions are made with regards to the deployment
1. you have virtual box installed and configured. 
2. you will be using vagrant to deploy the vms. 
3. the domain is example.com
4. puppet client will be run, and not a puppet master.
5. you will be using virtual box as the default provider.  This can quite easily be expanded to other providers, but is not in the scope of this project. 
6. all hiera data values are found in the hiera data folder under the relative folder of puppet/hiera.  
7. Vagrant version used is 1.2.4
8. Centos 6.4 x86_64  box is used. 

To get the environment up and running on your machine please run the following commands. 

1. Clone the repository to a folder somewhere on your filesystem. 
<pre>
$ : git clone https://github.com/ryanharper007/tester.git
</pre>
2. Change directory to the newley created clone. 
<pre>
$ cd tester
</pre>
3. Start up the vagrant environment
<pre>
$ : vagrant up  
</pre>
4. The vm will go into runlevel 5 once the install and config is completed. you can then access this box either through the console or through ssh
<pre>
$ : vagrant ssh
</pre>
5. Maven settings are deployed through puppet.  To test maven is working please carry out the following somewhere on your filesystem. 
<pre> 
$ : git clone https://github.com/sit/java-build-test.git
</pre>
6. Change directory to this clone
<pre>
$ : cd java-build-test
</pre>
7. Check that you can build the java project. 
<pre>
$ : mvn clean install. 
</pre>
That should be it. Happy testing!!
