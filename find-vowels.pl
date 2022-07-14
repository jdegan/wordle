#!/usr/bin/perl
open(MyFile, '<', '/Users/jegan/Playground/wordle/wordle-list') or die $! ;
while (<MyFile>){
push (@wordList, $_);
}
close(MyFile);
my $outFile = '/Users/jegan/Playground/wordle/oneVowel-list';
open(my $fh, '>', $outFile) or die "Cound not open file '$outFile' $!";
@listWordArray = @wordList;
######## split the current word into letters
foreach (@wordList) {
$loopOneCount++;
#print "Foreach 1 count:" . $loopOneCount . " " .  $_;
#sleep 1;
	chomp;
	$scoreWord = $_;
	@scoreWordLetters = split (//, $scoreWord);
	my $scoreWordFirst = $scoreWordLetters[0];
	my $scoreWordSecond = $scoreWordLetters[1];
	my $scoreWordThird = $scoreWordLetters[2];
	my $scoreWordFourth = $scoreWordLetters[3];
	my $scoreWordFifth = $scoreWordLetters[4];
	my $totalScore = 0;
####### run through each word and score the current word against all possible words
	#check to see if a vowel
			$vowelCount = 0;
			foreach $letter (@scoreWordLetters) {
			if ($letter eq "a" || $letter eq "e" || $letter eq "i" || $letter eq "o" || $letter eq "u" || $letter eq "y" ) {
			print "Letter Word is " . $letter . " " .  $scoreWord . "\n";
				$vowelCount++;
			#print $listWord . " " . $letter . "\n";
			}	
	
		}
	if ($vowelCount == 1) {
		push(@oneVowel, $scoreWord);
	}
}
	foreach $word (@oneVowel) {

	print $fh $word . "\n";

}
close $fh;
