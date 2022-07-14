#!/usr/bin/perl
use Data::Dumper;
my $inputFile = '/Users/jegan/Playground/wordle/reducedbatch';
open(MyFile, '<', $inputFile) or die "Cound not open file '$inputFile' $!";
	#%uniqueLetterWords = "";
while (<MyFile>){
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
