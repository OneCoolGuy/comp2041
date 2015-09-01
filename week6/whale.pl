#!/usr/bin/perl -w
$count = 0;
$sum = 0;
@lines = ();

if (@ARGV != 1) {
	die
}
@lines = <STDIN>;
foreach $line (@lines) {
	if ($line =~ m/\d\s$ARGV[0]/) {
		$count++;
		$line =~ /(\d+)/;
		$sum += $1;
	}
}
print "$ARGV[0] observations: $count pods, $sum individuals\n";



	






