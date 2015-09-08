#!/usr/bin.perl -w

my %words;
$word = "";

@lines = <STDIN>;
foreach $line (@lines) {
	$word = "";
	@chars = split("", $line);
	foreach $c (@chars){
		$c = lc $c;
		if ($c =~ m/[a-z]/i){
			$word = join('', $word, $c);
		} else {
			if (!exists $words{$word}){
				$words{ $word } = 1;
			} else {
				$words{ $word }++;
			}
			$word = "";
		}
	}
}

foreach $word (sort { $words{$a} <=> $words{$b} } keys %words) {
	printf "%-8s %s\n", $word, $words{$word} if $word !~ m/^\s*$/;
}
