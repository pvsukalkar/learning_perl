#!/usr/bin/perl -w
use strict;
my $filename = "english.txt";
my $tempfile = "punctuated.txt";
open (FILE,'<',$filename) || die "could not open english.txt";
open (FILE2,">$tempfile") || die "could not open punctutaed.txt";
my $sentenceFinished = 0;
my $lineno=0;
while (my $row = <FILE>){
	chomp $row; 
	#$row =~ s/\s+//g;
	if($sentenceFinished == 1 || $lineno == 0){
		$row =~ s/(\w)(.*)/uc($1).$2/eg;
	}
	$row =~ s/(\w+\s*[!.?]+\s*)(\w)(\w+)/$1.uc($2).$3/eg;
	print FILE2 $row."\n";
	print $row."\n";
	if( $row =~ m/[.?!]$/){
		$sentenceFinished=1;
	}
	else{
		$sentenceFinished=0;
	}
	$lineno++;
}
close FILE;
close FILE2; 
