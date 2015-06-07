#!/usr/bin/perl -w

#A simple web crawler to demonstrate LWP::Simple and perl 
use strict; 
use LWP::Simple; 

#my $url = shift @ARGV || die "";
my $url = shift || die "Please provide initial url as command line argument. Ex: perl web_crawler.pl http://www.thehindu.com";
my $max = 10 ; 

my $html = get($url); 
my@urls; 

while ($html =~ s/(http:\/\/\S+)[">]//) {
	push @urls, $1; 
} 

mkdir ("web",0755);
my $weburl="web/url.map";
open(URLMAP,">$weburl") || die "can't open url.map";

my $count=0;
print "urls size: ".$#urls;
for (my $i=0; $i<$max ; $i++) {
	my $source = $urls[int(rand ($#urls+1))];
	getstore($source,"web/$count.html");
	print URLMAP "$count\t$source\n";
	print STDERR "Getting $count: $source\n";
	$count++;
}

close URLMAP; 

