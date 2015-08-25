#!/usr/bin/perl -w

# while (TRUE){
# 	$arg = <STDIN>;
# 	if (!defined $arg){
# 		break;
# 	}
# 	foreach $c ( split //, $arg) {
# 		if ( $c =~  m/[0-4]/ ) {
# 			$c = "<";
# 			print "$c" ;
# 		} elsif ( $c =~  m/[6-9]/ ) {
# 			$c = ">";
# 			print "$c";
# 		} else {
# 			print "$c";
# 		}
# 	}
# }
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

