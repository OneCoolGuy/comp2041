#!/usr/bin/perl -w

@prereq = ();
@prereqpos = ();
@prereqund = ();
$index = 0;
$how_many_more = 0;
$the_best_flag = 1;

die if @ARGV == 0;
if ($#ARGV == 1) {
	$rflag = 1;
	shift @ARGV;
}

$url_under = "http://www.handbook.unsw.edu.au/undergraduate/courses/2015/$ARGV[0].html";
$url_post = "http://www.handbook.unsw.edu.au/postgraduate/courses/2015/$ARGV[0].html";
unless (open F, "wget -q -O- $url_under|"){
	$flag1 = 0;
}

unless (open G, "wget -q -O- $url_post|"){
	$flag2 = 0;
}

if (!$flag1 ){
	while ($line = <F>) {
		if ($line =~ m/>[pP](re[-]?[Rr]?e?q?.*?)</)  {
			@temp = ( $1 =~ m/([A-Za-z]{4}\d{4})/g);
			push(@prereqund , @temp);
		}
	}
}
@temp = ();
if (!$flag2){
	while ($line = <G>){
		if ($line =~ m/>[pP](re[-]?[Rr]?e?q?.*?)</)  {
			@temp = ( $1 =~ m/([A-Za-z]{4}\d{4})/g);
			push(@prereqpos, @temp);
		}
	}
}
if (@prereqund == -1 and @prereqpos == -1){
	$the_best_flag = 0;
} else {
	push(@prereq, @prereqund);
	push(@prereq, @prereqpos);
}

if ($rflag){
	while ($the_best_flag){
		$how_many_more = 1 + $#prereqund + $#prereqpos;
		@prereqund = ();
		@prereqpos = ();
		$course = $prereq[$index];
		$tempindex = $index;
		while($index <= $tempindex + $how_many_more){
			$url_under = "http://www.handbook.unsw.edu.au/undergraduate/courses/2015/$course.html";
			$url_post = "http://www.handbook.unsw.edu.au/postgraduate/courses/2015/$course.html";
			unless (open F, "wget -q -O- $url_under|"){
				$flag1 = 0;
			}

			unless (open G, "wget -q -O- $url_post|"){
				$flag2 = 0;
			}

			@temp = ();
			if (!$flag1 ){
				while ($line = <F>) {
					if ($line =~ m/>[pP](re[-]?[Rr]?e?q?.*?)</)  {
						@temp = ( $1 =~ m/([A-Za-z]{4}\d{4})/g);
						push(@prereqund , @temp);
					}
				}
			}
			@temp = ();
			if (!$flag2){
				while ($line = <G>){
					if ($line =~ m/>[pP](re[-]?[Rr]?e?q?.*?)</)  {
						@temp = ( $1 =~ m/([A-Za-z]{4}\d{4})/g);
						push(@prereqpos, @temp);
					}
				}
			}
			$index = $index + 1;
			$course = $prereq[$index];
		}
		if ($#prereqund == -1 and $#prereqpos == -1){
			$the_best_flag = 0;
		} else {
			push(@prereq, @prereqund);
			push(@prereq, @prereqpos);
		}
	}
}

	
$count = 0;
foreach $line (@prereq){
	$prereq[$count] = uc $line;
	$count = $count + 1;
}
	
sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}
@prereq = uniq(@prereq);
@prereq = sort @prereq;
print join("\n", @prereq);
print "\n" if ($#prereq != -1);
