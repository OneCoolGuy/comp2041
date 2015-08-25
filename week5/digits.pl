#!/usr/bin/perl -w

foreach $arg ( <> ) {
	foreach $c ( split //, $arg) {
		if ( $c =~  m/[0-4]/ ) {
			$c = "<";
			print "$c" ;
		} elsif ( $c =~  m/[6-9]/ ) {
			$c = ">";
			print "$c";
		} else {
			print "$c";
		}
	}
}
print "\n";

