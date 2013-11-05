#HashPipe

All in One CLI-based Collection of Forensic Tools

Copyright HashPipe 2013, licensed under GNU General Public License

##Overview

HashPipe is a tool designed for convenience and ease of use to a forensic investigator. It was originally started as a final project for a Computer Forensics course at Rochester Institute of Technology. Its main features include:

* Command Line interface with number-based GUI options   
* Bit by bit copying of any hard drive image  
* Hashing of images for integrity and following chain of custody  
* Imaging of physical memory (only valid for Linux kernels below 2.6)  
*Considering options for more recent kernels

* Analyzing running processes  
* Analyzing network activity which includes: active connections, protocols, running network services, routing tables, listening on ports, and network processes  
* Analyzing system data (ifconfig, top, ps, etc)
* Copying of system logs to an external device



##Components and requirements

The application is currently supported on the Unix/Linux platform. The majority of the tools are built with both Perl and bash scripts, utilizing simple Linux Commands. HashPipe is in the process of testing and creation, but some of our target environments are of the following:


* Ubuntu  
* Kali Linux (1.0.5 and below)  
* Backtrack (previous versions)  

Other Linux versions than the above are likely to work. The key element is the version of the Linux kernel, and its compatibility with certain tools.

###Installation instructions

See file Doc/Installation.txt. An installer script exists to do most of the work with minor configuration.

##Stuff

The tool was and still is an academic project to be used by forensic investigators responsibly. Error checking will arise mostly from the output of Linux commands used. Therefore, it is not 100% free of user error. 

Malicious use will be up to the morality of the user. If used for its intended purposes, the program will not cause deliberate harm or damage to anyone's personal data and its wellbeing.


##Documentation

A simple manual and extension design notes can be found in Documentation.

####Author and contact details

######Evan Tiefenthaler
emt1891@rit.edu

######Adam Kroll
alk8593@rit.edu

######Nicholette Fortune
nsf2522@rit.edu<br></br> 
Comments, suggestions and feedback are welcome
