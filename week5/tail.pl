#!/usr/bin/perl -w
$nmlines = 10;
@files = ();
@lines = ();
@result = ();
foreach $arg (@ARGV) {
    if ($arg =~ m/^-\d+$/) {
		$arg =~ s/-//;
		$nmlines = $arg;
	} else  {
        push @files, $arg;
    }
}
if (@files != 0) {
	foreach $f (@files) {
		open(F,"<$f") or die "$0: Can't open $f: $!\n";
		if ($#files > 0){
			print("==> $f <==\n");
		}
		@lines = reverse <F>;
		for $i (0..$nmlines - 1){
			push @result, $lines[$i];
			if ($i  == $#lines){
				last;
			}
		}
		while (@result != 0){
			$temp = pop @result;
			print "$temp";
		}
		close(F);
	}
} else {
	@lines = reverse <STDIN>;
	for $i (0..($nmlines - 1)){
		push @result, $lines[$i];
		if ($i  == $#lines){
			last;
		}
	}
	while (@result != 0){
			$temp = pop @result;
			print "$temp";
	}
}
