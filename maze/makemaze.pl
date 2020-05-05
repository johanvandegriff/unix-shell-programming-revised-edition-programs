#!/usr/bin/perl

use warnings;
use strict;

my @saved = ();
my @current = ();

my $filename = "/home/johanv/programs/maze/maze.txt" ;

open(LOCATION, $filename) or die "Cannot open $filename: $!\n";
my $top_dir = <LOCATION>;
close(LOCATION);

mkdir $top_dir/maze

$filename = "$top_dir/maze.txt"

open(FILE, $filename) or die "Cannot open $filename: $!\n";
while ( <FILE> ) {
  # set each item of @current to each letter of $_
  # for each item of @current:
  #   if the item is an X:
  #     read from @saved
  #   otherwise:
  #     overwrite that item of @saved from @current
  # make a directory based on @current
}
close(FILE);
