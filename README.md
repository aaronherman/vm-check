# VM Check

## Purpose
VM Check is a Perl script that also uses PowerShell to assist with settings up a VM to be used to analyze malware samples. Since some malware samples will remove themselves if certain criteria hasn't been met, the script will look at and change certain settings. 

This is mainly a project for me to test out and learn Perl. I am also using PowerShell commands for some of the gathering of info, or changing of information on the machine. There are other techniques to find out if the malware sample is being ran on a VM, but this will look at the basics and provide hints or make changes to make it look like a real machine. 


## Future improvements
- [ ] Check for networking adapters, make sure they're not labeled as "VM...."
- [ ] Test to see if connected to Internet/FakeNet.
- [ ] Run commands to change hostname, user account, etc. to be changed to some random or preconfigured choices.
- [x] Add a fake default printer.
- [ ] Convert to .exe file, so Perl doesn't need to be installed. Likely using PAR::Packer.
- [ ] Check registry for VM remnants.

## How to run
Currently, run `perl vmcheck.pl` and eventually it will be an executable.

