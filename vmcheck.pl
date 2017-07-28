use Win32::SystemInfo;
use Win32::DriveInfo;
use Win32;
use Sys::Hostname;

use Win32::Console::ANSI;
use Term::ANSIColor;

use DBI;
my $dbh = DBI->connect('dbi:WMI:');

sub main {
  print "\n====================\n";
  print " System Information\n";
  print "====================\n\n";


  my $os_name = Win32::GetOSDisplayName();
  print "OS Name: $os_name\n";

  my $admin = Win32::IsAdminUser();
  print "Admin running script: ", $admin ? "Yes" : "No","\n";


  my $name = Win32::LoginName();
  print "Login name: $name\n";

  $host = hostname;
  print "Host Name: $host\n";


  #Default printer
  my $printer_query = $dbh->prepare(<<WQL);
    SELECT * FROM Win32_Printer WHERE Default = TRUE
WQL

  $printer_query->execute();
  while (my @row = $printer_query->fetchrow) {
    print "Default Printer: ", $row[0]->{Caption}, "\n";
  }


  print "\n======================\n";
  print " Hardware Information\n";
  print "======================\n\n";


  my %memory;
  Win32::SystemInfo::MemoryStatus(%memory,'GB');
  print "RAM: $memory{TotalPhys} Gb\n";

  if (($os_name =~ /(([^64-bit]+))/) && ($memory{TotalPhys} < 3.8)) {
    print color("red"), "64-bit OS with less than 3.8Gb RAM\n", color("reset");
  } else {
    if (($os_name =~ /(([^64-bit]+))/) && ($memory{TotalPhys} > 3.8)) {
      print "64-bit OS with more than 3.8Gb RAM\n";
    } else {
      if ($os_name =~ /(([^32-bit]+))/) {
        print "32-bit OS"
      }
    }
  }
  my $drive =  Win32::FsType();
  print "Drive: $drive\n";


  ##############
  # input
  #############
  print "Would you like to add a dummy printer (y/n)? ";
  my $printer_input = <STDIN>;
  chomp $printer_input;

  if ($printer_input eq 'n' || $printer_input eq 'N') {
    print "Will not add a dummy printer";
  } elsif ($printer_input eq 'y' || $printer_input eq 'Y') {
      add_printer();
  } else {
    print "Please enter a valid y/n answer."
  }

}

#################
#Add printer code
#################

sub add_printer {
  #Location of PowerShell
  my $powershell = 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe';
  #Array of printer names
  my @printer_names = ("HP LaserJet 4350", "RICOH Aficio CL3500N PS", "RICOH Aficio CL3500N PS", "HP Officejet 4620", "Epson Home XP-330", "Epson ET-3600 EcoTank All-in-One");
  #Get a random printer from the array "printer_names"
  my $print_rand = int(rand(scalar @printer_names));

  print "Adding printer...\n";

  #Builds the command
  my $command = 'Add-Printer -Name \"' . $printer_names[$print_rand] . '\" -DriverName \"Microsoft XPS Document Writer v4\" -PortName \"portprompt:\"';
  #Run command and save result
  $result = `$powershell -command "$command"`;

  if ($result) {
    print "Adding printer failed. It may already be added\n";
  } else {
    print "Successfully added printer\n";
  }

  print $result;
}



my @computer_names = ("Johnson-PC", "Home-PC", "LivingRoom-PC", "Smith-PC", "Anderson-PC", "Johnson-Desktop", "Johnson-Laptop");



main();
