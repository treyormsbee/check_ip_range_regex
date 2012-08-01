#!/usr/bin/perl
use strict;

my $numargs = $#ARGV + 1;
if ( $numargs != 2 )
{  print "Please provide IPADDRES/NETWORK and REGEX as an argument\n\n";
  exit 1;
}

my @IPINFO = split(/\//,$ARGV[0]);
my $IP = $IPINFO[0];
my $NET = $IPINFO[1];
my $REGEX = $ARGV[1];
my $NUMIPS = (2 ** ( 32 - $NET ));

print "IP = $IP\nNET = $NET\nNUMIPS = $NUMIPS\nREGEX = $REGEX\n"; 
my @splitIP = split(/\./,$IP);
my @splitRE = split(/\\\./,$REGEX);
my ( $matches, $x, $a, @rematches );
$matches = $rematches[0] = $rematches[1] = $rematches[2] = $rematches[3] = 0;

for ( $x = 0; $x <= 3; $x++ )
{ $splitRE[$x] =~ s/\^//;
  $splitRE[$x] =~ s/\$//;
  if ( $splitRE[$x] =~ /[\(\)|\[\]*]/ )
  { for ( $a = 0; $a <= 255; $a++ )
    { if ( $a =~ /^$splitRE[$x]$/ ) 
      { $rematches[$x]++;
      }
    }
  } else {
    for ( $a = 0; $a <= 255; $a++ )
    { if ( $a == $splitRE[$x] )
      { $rematches[$x]++;
      }
    }
  }
}

my $matches = $rematches[3] * $rematches[2] * $rematches[1] * $rematches[0];

print "matches = $matches\n";
