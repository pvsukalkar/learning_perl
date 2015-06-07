#!/usr/bin/perl -w 


use strict;

#Printing factorials to learn  recursive function 
my $num=5;
my $factorial=fact($num); 
print "factorial(".$num.") = ".$factorial;
sub fact{
	if($_[0] == 0) {return 1;} 
	if($_[0] == 1) {return 1;} 
	else{ return $_[0] * fact($_[0] -1 );} 
}
