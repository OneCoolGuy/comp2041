#!/usr/bin/perl -w

$number = 0;
$count = 0;
@lines = ();
@whales = ();
my %number_of_ind;
my %number_of_pods;

@lines = <STDIN>;
foreach $line (@lines) {
	if ($line =~ m/(\d+)\s*(.*)\s*/i) {
		$number = $1;
		$name = lc $2;
		$name =~ s/\h+/ /;
		$name =~ s/\s+$//;
		$name =~ s/s$//;
		if (!exists $number_of_pods{$name}){
			$number_of_pods{$name} = 0;
			$number_of_ind{$name} = 0;
			$whales[$count] = $name;
			$count++;
		}
		$number_of_pods{$name}++;
		$number_of_ind{$name} += $number;
	}
}

@whales = sort @whales;

foreach $whale (@whales){
	print "$whale observations:  $number_of_pods{$whale} pods, $number_of_ind{$whale} individuals\n";
}






