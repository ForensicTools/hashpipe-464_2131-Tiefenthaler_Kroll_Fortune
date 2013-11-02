#!/usr/bin/perl
use strict;
use warnings;


#open files here; need files for current sys stats?
#grab time, create new directory to put current working files into


#asks user for input to what new folder is going to be called
print "Please enter the name of this project: ";
my $folder = <STDIN>;
print $folder;

#gets current working directory, and makes new folder for the project
my $directory = `pwd`;
chomp $directory;
my $newDir = "mkdir $directory/$folder";
system($newDir);

#absolute path to the folder that was just created
my $workingDir = "$directory/$folder";

#function to capture images of hdd's
#use dd for this, make sure to exclude the removable media



#function to copy memory
#use dd for this



#function to copy logs over
#probably use something like cp or tail all of the logs over to removable media?



#function to collect current system data
#includes ifconfig, netstat, top, ps
#either single bash script or run system or `` commands



#GUI Section, mostly number based

while (

print options

Ask user for input
Chomp input, check for correct formatting

create if and else statements to determine what functions to run, functions listed above
make this in a while loop that only ends with a ctrl + c or a quit option

)