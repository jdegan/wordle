#!/usr/bin/perl
use Data::Dumper;
#use Data::Dump;
#open a file that contains the remaining possible words
open(PossibleWords, '<', '/Users/jegan/Playground/wordle/batch') or die $! ;
	%uniqueLetterWords = "";
while (<PossibleWords>){
	print $_;
	chomp;
	@lineValues = "";
	@lineValues = split( //, $_);
		foreach $letter (@lineValues) {
		#print $letter . "\n";
		$remaingPossibleWords{$letter}{$_} = $_;
		}
		
}
close(PossibleWords);
print Dumper(\%uniqueLetterWords);
open(RemainingWords, '<', '/Users/jegan/Playground/wordle/reducedbatch') or die $! ;
while (<RemainingWords>){
	chomp;
	%uniqueLetters = "";
	@lineValues = "";
	$wordScore = "";
	@lineValues = split( //, $_);
		foreach $letter (@lineValues) {
			$uniqueLetters{$letter} = $letter;
		}
	$wordCount = 0;
	foreach $k (keys %uniqueLetters) {
		$wordCount = keys %uniqueLetters};
		print $_ . "$wordCount $k \n";
}
		
######## split the current word into letters
#foreach (@PossibleGuessList) {
	#@lineValues = "";
##you have all the values in the array
	##check to see what words remain
	#%uniqueLetterWords = "";
	#$scoreWord = $lineValues[0];
	#@scoreWordLetters = split (//, $scoreWord);
	#$count = 0;
		#foreach $letter (@scoreWordLetters) {
			#if (exists $uniqueLetterWords{$letter})	{
			#last;
			#}
		#$uniqueLetterWords{$letter}++;
		#$count++
#
		#}
#if ($count == 5) {
	#printf $fh $scoreWord . ": " . $lineValues[2] . "\n";
#}
	#my $scoreWordFirst = $scoreWordLetters[0];
	#my $scoreWordSecond = $scoreWordLetters[1];
	#my $scoreWordThird = $scoreWordLetters[2];
	#my $scoreWordFourth = $scoreWordLetters[3];
	#my $scoreWordFifth = $scoreWordLetters[4];
	#my $totalScore = 0;
#}
#
