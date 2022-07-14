#!/usr/bin/perl
use Data::Dumper;
my $inputFile = '/Users/jegan/Playground/wordle/letters';
my $wordFile = '/Users/jegan/Playground/wordle/letters';
open(MyLetterFile, '<', $inputFile) or die "Cound not open file '$inputFile' $!";
open(MyWordFile, '<', $wordFile) or die "Cound not open file '$wordFile' $!";
	#%uniqueLetterWords = "";

while (<MyLetterFile>){
	chomp $_;
	:wq

}
while (<MyWordFile>){
######## split the current word into letters
	@lineValues = "";
	$word = $_;
	chomp $word;
	#print $_;
	@lineValues = split( /\s+/, $_);
	$scoreWord = $lineValues[0];
	@scoreWordLetters = split (//, $scoreWord);
	#print "\"" . $scoreWordLetters[0] . "\"" . "\n";
		foreach $letter (@scoreWordLetters) {
		#print $word . "\n";
		$uniqueLetterWords{$letter}++;
			if (exists $wordCount{$letter}{$word})	{
			#print "$word and $letter exist \n";
			next;
			}
			else {
			#print "$word and $letter do not exist \n";
			$wordCount{$letter}{$word}++;
			}
		#sleep 1;
		}
}
#print Dumper \%wordCount;
foreach my $letter (sort keys %wordCount) {
	#printf $letter . "\n";
	my %hash = %{$wordCount{$letter}};

	foreach my $word (keys %hash ) {
	#printf $word . $hash{$word} . "\n";
	$wordsLetterIsIn{$letter}++;
	#print $wordsLetterIsIn{$letter};
}
}
#print "$_ => ", $wordCount{$_}, "\n" for keys %wordCount;
foreach my $l (sort keys %uniqueLetterWords) {
	#$count++;
	#printf $l . " : ". $uniqueLetterWords{$l} . " : " . $count . "\n";
	printf $l . " : ". $uniqueLetterWords{$l}  . " : " . $wordsLetterIsIn{$l} . "\n";
}
printf $count . "\n";
