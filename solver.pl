#!/usr/bin/perl
use Data::Dumper;
$Data::Dumper::Indent = 1;
$Data::Dumper::Sortkeys = 1;
open(MyFile, '<', '/Users/jegan/Playground/wordle/reducedbatch') or die $! ;
my %LetterCounter;
while (<MyFile>){
	chomp;
#print $_;
@f = split (//, $_);
my $first = $f[0];
my $second = $f[1];
my $third = $f[2];
my $fourth = $f[3];
my $fifth = $f[4];
#print $first . " is first\n";
#print $second . " is second\n";

#### 
$LetterCounter{$first}{first}++;
$LetterCounter{$second}{second}++;
$LetterCounter{$third}{third}++;
$LetterCounter{$fourth}{fourth}++;
$LetterCounter{$fifth}{fifth}++;
$LetterCounter{$first}{total}++;
$LetterCounter{$second}{total}++;
$LetterCounter{$third}{total}++;
$LetterCounter{$fourth}{total}++;
$LetterCounter{$fifth}{total}++;


}
#while ( ($k,$v) = each %LetterCounter) {
	#print "$k => $v";
	#print Dumper $k, $LetterCounter{$k};
#}
print "Letter, First, Second, Third, Fourth, Fifth \n";
foreach my $name (sort keys %LetterCounter) {
print $name, " : ";
print $LetterCounter{$name}{total}, " : " ;
print $LetterCounter{$name}{first} , " : ";
print $LetterCounter{$name}{second},  " : ";
print $LetterCounter{$name}{third},  " : ";
print $LetterCounter{$name}{fourth},  " : ";
print $LetterCounter{$name}{fifth}, "\n";
	#print $name, $LetterCounter{$name};
}
#print $LetterCounter{j}{total} . "\n" . $LetterCounter{a}{first} . "\n";

close(FH);
