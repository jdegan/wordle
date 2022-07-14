#!/usr/bin/perl
use Data::Dumper;
my $inputFile = '/Users/jegan/Playground/wordle/batch';
open(MyFile, '<', $inputFile) or die "Cound not open file '$inputFile' $!";
	#%uniqueLetterWords = "";
while (<MyFile>){
######## split the current word into letters
	@lineValues = "";
	$word = $_;
#grep rid of newline
	chomp $word;
	#print $_;
#split on whitespace?
	@lineValues = split( /\s+/, $_);
#take the first word
	$scoreWord = $lineValues[0];
#split it into characters
	@scoreWordLetters = split (//, $scoreWord);
	#print "\"" . $scoreWordLetters[0] . "\"" . "\n";
		foreach $letter (@scoreWordLetters) {
		#print $word . "\n";
		$word{$letter}++;
			}
		foreach my $w (sort keys %word) {		
			#print $word . " : " . $w . "\n";
			if ($word{$w} >= 3) {
			$tripleConsonantWords{$word} = $w;
			#print $tripleConsonantWords{$word} . "\n";
			#sleep 1;
			}
		}
		%word = "";
}
#print Dumper \%tripleConsonantWords;
foreach my $wordle (sort keys %tripleConsonantWords) {
	print "$wordle : $tripleConsonantWords{$wordle} \n";
	}
