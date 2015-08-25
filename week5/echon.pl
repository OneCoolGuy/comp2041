#!/usr/bin/perl -w
if (@ARGV != 2 || $ARGV[0] !~ m/^\d+$/){
	die "Usage: ./echon.pl <number of lines> <string>"
}
for (1..$ARGV[0]){
	print $ARGV[1] , "\n";
}
