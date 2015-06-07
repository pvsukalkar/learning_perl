#!/usr/bin/perl

use strict;
use Math::Complex;

my $max = 100;
print "Primes less than ".$max." are :\n";
for ( my $i=2; $i<$max ; $i++){
        my $j=1;
	for( $j=2; $j<=sqrt($i); $j++){
                if($i%$j == 0){
			last; 
                }
       	}
	if($j > sqrt ($i)) {
		print $i."\n";
	}
}
