#!/usr/bin/perl -w
use strict ; 
my $filename="/usr/share/dict/words";
open(FILE,'<',$filename) || die "Could not open dictionary file";
sub last_index{
	my $text = $_[0];
	my $char = $_[1];
	my $offset = 0;
	my $temp_pos = 0;  
	while (1) {
		my $position = index($text, $char, $offset);
		last if ($position < 0 ); 
		$offset++;
		$temp_pos = $position; 
	}
	return $temp_pos; 
}
while (my $row =<FILE>) {
	chomp $row; 
	$row = lc $row; 
	if ($row =~ m/[b-df-hj-np-z]*u[b-df-hj-z]*o[b-df-z]*i[b-z]*e\w*a\w*/ ) {
	   my $index_e = last_index($row,'e');
	   my $index_i = last_index($row,'i');
	   my $index_o = last_index($row,'o');
	   my $index_u = last_index($row,'u');
	   my $start_a = index($row,'a');
	   my $start_e = index($row,'e');
	   my $start_i = index($row,'i');
	   my $start_o = index($row,'o');
	   if( $index_u < $start_o && $index_o < $start_i && $index_i < $start_e && $index_e < $start_a ) {
		print $row."\n";
	   }
	}
}
close FILE;
print "Exited file"; 
