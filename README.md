# VM Check

## Purpose
VM Check is a Perl script that can be used to see which settings still need to be changed in order to hide that you're running a Windows VM. When doing malware analysis, some malware samples will remove themselves if certain criteria hasn't been met. This is intended to give guidance on what might need to be changed in order to do Malware Analysis.

This is mainly a project for me to test out and learn Perl. There are other techniques to find out if the malware sample is being ran on a VM, but this will look at the basics and provide hints on things to check. Eventually it will be able to change the hostname, user account name, etc. 


## Future improvements
- [ ] Check for networking adapters.
- [ ] Test to see if connected to Internet/FakeNet.
- [ ] Run commands to change hostname, user account, etc. to be changed to some random or preconfigured choices.
- [ ] Add a fake default printer.
- [ ] Convert to .exe file, so Perl doesn't need to be installed.
- [ ] Check registry for VM remnants.

## How to run
Currently, run `perl vmcheck.pl` and eventually it will be an executable.

