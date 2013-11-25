#HashPipe

All-in-One CLI-based Collection of Forensic Tools for Linux

Copyright HashPipe 2013, licensed under GNU General Public License


##Overview

HashPipe is a tool designed for convenience and ease of use for a forensics investigator. It originally started as a final project for Bill Stackpole's Computer Forensics course at the Rochester Institute of Technology. Its main features include:

* Command Line Interface with number-based GUI options   
* Bit-by-bit copying of hard drive images, either local or removable  
* Hashing of collected images for integrity and chain of custody  
* Imaging of physical memory (only valid for Linux kernels below 2.6)
* Copying of system logs to an external device
* Analyzing current system statistics including:
	* network activity (active connections, protocols, running network services, routing tables, listening on ports, and network processes)
	* system data (ifconfig, top, ps)


##Components and requirements

The application is currently supported on the Unix/Linux platform. The majority of the tools are built utilizing Perl and Linux commands. HashPipe is in the process of being tested and created, but some of our target environments are of the following:

* Ubuntu
* Kali Linux (1.0.5 and below)
* Backtrack (previous versions)
* CentOS (5.0 and above)

NOTE: Other Linux versions then the above are likely to work correctly, but they have yet to be tested.


##Installation instructions

Download 'HashPipe.pl' and run the script. No installer is necessary to run the program.


##Stuff

The tool was and still is an academic project to be used by forensic investigators responsibly. Error checking will arise mostly from the output of Linux commands used. Therefore, it is not 100% free of user error and we cannot ensure absolute image capture integrity.

If used for its intended purposes, the program will not cause deliberate harm or damage to anyone's personal data and its wellbeing.


##Documentation

A simple manual and extension design notes can be found in Documentation.

####Author and contact details

######Evan Tiefenthaler
emt1891@rit.edu

######Adam Kroll
alk8593@rit.edu

######Nicholette Fortune
nsf2522@rit.edu

Comments, suggestions and feedback are welcome
