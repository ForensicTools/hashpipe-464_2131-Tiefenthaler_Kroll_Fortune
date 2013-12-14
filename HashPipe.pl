#!/usr/bin/perl
use strict;
use warnings;


#asks user for input to what new folder is going to be called
print "Please enter the name of this project: ";
my $folder = <STDIN>;
chomp $folder;

#gets current working directory, and makes new folder for the project
my $directory = `pwd`;
chomp $directory;
my $newDir = "mkdir $directory/$folder";
system($newDir);

#absolute path to the folder that was just created
my $workingDir = "$directory/$folder";

#function to capture images of hdd's
sub imgDrive() {

	#prints output from mount command for user reference
	print "Mount Points: \n\n";
	my $output = `mount`;
	print "$output\n";
	
	#asks user what drive to image
	print "Please enter the name of the drive you would like to image (eg sda1, sdb1): ";
	my $drive = <STDIN>;
	chomp $drive;

	#reopens stdout and stderr or kills the program
	open STDOUT, '>', \$stdout or die "Can't open STDOUT: $!";
	open STDERR, '>', \$stderr or die "Can't open STDERR: $!";
	
	#images drive
	my $imgDrive = "dd if=/dev/$drive of=$workingDir/$drive\.dd conv=sync,noerror";
	system($imgDrive);
	
	#hashes original drive and stores the hash
	my $hashOrig = "md5sum /dev/$drive >> $workingDir/hashes.txt";
	system($hashOrig);

	#hashes image and stores the hash
	my $hashImg = "md5sum $workingDir/$drive\.dd >> $workingDir/hashes.txt";
	system($hashImg);

	#takes stdout and outputs it to a log file
	$printStdout = "cat 'Hashing Function:\n$stdout\n' >> $workdingDir/OutputLog.txt";
	system($printStdout);

	#copies the output from stderr and writes it to the ErrorLog.txt file
        $printStderr = "cat 'Hashing Function:\n$stderr\n' >> $workdingDir/ErrorLog.txt";
        system($printStderr);

	#closes stdout and stderr
	close STDOUT;
	close STDERR;
}

#function to copy memory
sub copyMem() {

	#reopens stdout and stderr or kills the program
        open STDOUT, '>', \$stdout or die "Can't open STDOUT: $!";
        open STDERR, '>', \$stderr or die "Can't open STDERR: $!";

	#images memory (only works if not blocked by kernel
	my $ddMem = "dd if=/dev/mem of=$workingDir/Mem.dd conv=sync,noerror";
	system($ddMem);

	#hashes the memory image
	my $hashMem = "md5sum $workingDir/Mem.dd >> $workingDir/hashes.txt";
	system($hashMem);

	#images kernel memory (only works if not blocked by kernel)
	my $ddKMem = "dd if=/dev/kmem of=$workingDir/KMem.dd conv=sync,noerror";
	system($ddKMem);
	
	#hashes the kernel memory image
	my $hashKMem = "md5sum $workingDir/KMem.dd >> $workingDir/hashes.txt";
	system($hashKMem);

	#takes stdout and outputs it to a log file
        $printStdout = "cat 'Memory Function:\n$stdout\n' >> $workdingDir/OutputLog.txt";
        system($printStdout);

        #copies the output from stderr and writes it to the ErrorLog.txt file
        $printStderr = "cat 'Memory Function:\n$stderr\n' >> $workdingDir/ErrorLog.txt";
        system($printStderr);

	close STDOUT;
	close STDERR;
}


#function to copy logs over
sub copyLogs() {

	open STDERR, '>', \$stderr or die "Can't open STDERR: $!";

	#creates a file and runs the cp command
	my $cpCommand = "cp -r /var/log $workingDir/logs";
	system($cpCommand);

	#copies the output from stderr and writes it to the ErrorLog.txt file
        $printStderr = "cat 'Log Copying Function:\n$stderr\n' >> $workdingDir/ErrorLog.txt";
        system($printStderr);

	close STDERR;
}


#function to collect current system data
#includes the commands ps, ifconfig, netstat, and top
#these commands store their output in files in the projects folder created earlier
sub current() {

	open STDERR, '>', \$stderr or die "Can't open STDERR: $!";

	#creates a file and runs the ps command
	my $psCommand = "ps -ef > $workingDir/psOutput.txt";
	system($psCommand);
	
	#creates a file and runs the ifconfig command
	my $ifCommand = "ifconfig > $workingDir/ifconfigOutput.txt";
	system($ifCommand);
	
	#creates a file and runs the netstat command
	my $netCommand = "netstat -an > $workingDir/netstatOutput.txt";
	system($netCommand);
	
	#creates a file and runs the top command
	my $topCommand = "top -b -n 1 > $workingDir/topOutput.txt";
	system($topCommand);

        #copies the output from stderr and writes it to the ErrorLog.txt file
        $printStderr = "cat 'Current System Statistics Function:\n$stderr\n' >> $workdingDir/ErrorLog.txt";
        system($printStderr);

        close STDERR;

}
	
	

#GUI Section

#standard GUI loop
while () {

	#GUI options
	print "\nWelcome to HashPipe\n\n";
	print "Legal Disclaimer:\nHashPipe is intended for individual and corporate use alike.  The scope of\nHashPipe use is limited to that which is listed in the menu options and shall\nnot under any circumstances be implemented with malicious intent.  All HashPipe\nuse is the responsibility of the user and the user alone and HashPipe accepts\nno responsibility for any harm accidental or otherwise caused to any individual\nor machine.  For further information regarding HashPipe policies and terms\nof use, please consult the HashPipe Legal Advisory Team or check the End User License\nAgreement for additional details.\n\n";
	print "Please select from the following options below:\n";
	print "1) Image and Hash Local Drives\n";
	print "2) Image and Hash Memory\n";
	print "3) Copy Log Files\n";
	print "4) Capture Current System Statistics\n";
	print "5) Do All Of The Above\n";
	print "6) Quit\n\n";
	print "Please input a menu selection (Number Only): ";
	
	#takes input from keyboard
	my $input = <STDIN>;  
	chomp $input;

	#Checks if valid input, otherwise asks user for a valid input
	if($input > 0 && $input < 7) {
		print "\n\n";
		if ($input == 1) {
			#Runs the image/hash on local drives function
			imgDrive()
		}

		if ($input == 2) {
			#Runs the image/hash on memory function
			copyMem();
		}

		if ($input == 3) {
			#Copies the log files to the directory
			copyLogs();
		}

		if ($input == 4) {
			#Captures current system info function
			current();
		}

		if ($input == 5) {
			#DO ALL THE THINGS
			imgDrive();
			copyMem();
			copyLogs();
			current();
		}

		if ($input == 6) {
			last;
		}
	}

	else {
		print "\nInvalid menu selection. Please select a valid menu option.\n\n";
	}
}

