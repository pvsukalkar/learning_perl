#!/usr/bin/perl
use strict;
my $num=10;

fib($num);

sub fib{
        print "fib 1: 1\n";
        print "fib 2: 1\n";
        my $first=1;
        my $second=1;
        my $temp=1;
        for (my $i=3; $i< $num; $i++){
				$temp=$first; 
                $first=$second;
                $second=$temp + $first;
                print "fib ".$i.": ".$second."\n";
        }
}

