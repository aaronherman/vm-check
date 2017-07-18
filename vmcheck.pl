use Win32::SystemInfo;
use Win32::DriveInfo;
use Win32;

use Win32::Console::ANSI;
use Term::ANSIColor;

print "====================\n";
print " System Information\n";
print "====================\n";


my $os_name = Win32::GetOSDisplayName();
print "OS Name: $os_name\n";

my $admin = Win32::IsAdminUser();
print "Admin running script: ", $admin ? "Yes" : "No","\n";


my $name = Win32::LoginName();
print "Login name: $name\n";

my $node = Win32::NodeName();
print "Host Name: $node\n";

print "======================\n";
print " Hardware Information\n";
print "======================\n";


my %memory;
Win32::SystemInfo::MemoryStatus(%memory,'GB');
print "RAM: $memory{TotalPhys} Gb\n";

if (($os_name =~ /(([^64-bit]+))/) && ($memory{TotalPhys} > 3.9)){
  print color("red"), "64-bit OS with less than 3.9Gb RAM\n", color("reset");
}


my %drive = Win32::DriveInfo::DriveType("NTFS");
print "Drive: $drive";
