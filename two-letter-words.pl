#!/usr/bin/perl
use Data::Dumper;
my $inputFile = '/Users/jegan/Playground/wordle/batch';
#my $inputFile = '/Users/jegan/Playground/wordle/wordle-list';
#my $inputFile = '/Users/jegan/Playground/wordle/oneVowel-list';
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
			$countLetters++;
			}
		if ($countLetters <=4){
		printf "$word \n";
		}
		%word = "";
			$countLetters = 0;
}
