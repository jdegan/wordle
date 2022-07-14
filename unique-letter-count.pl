#!/usr/bin/perl
## 
##count the unique letters in a set of words found in the batch file
##
my $inputFile = '/Users/jegan/Playground/wordle/batch';
open(MyFile, '<', $inputFile) or die "Cound not open file '$inputFile' $!";
	#%uniqueLetterWords = "";
while (<MyFile>){
######## split the current word into letters
	@lineValues = "";
#	print $_;
	@lineValues = split( /\s+/, $_);
	$scoreWord = $lineValues[0];
	@scoreWordLetters = split (//, $scoreWord);
	#print "\"" . $scoreWordLetters[0] . "\"" . "\n";
		foreach $letter (@scoreWordLetters) {
			if (exists $uniqueLetterWords{$letter})	{
			next;
			}
		$uniqueLetterWords{$letter}++;
		}
}
foreach my $l (sort keys %uniqueLetterWords) {
	$count++;
	#printf $l . " : ". $uniqueLetterWords{$l} . " : " . $count . "\n";
	printf $l . "\n";
}
#printf $count . "\n";
