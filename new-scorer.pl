#!/usr/bin/perl
open(MyFile, '<', '/Users/jegan/Playground/wordle/wordle-list') or die $! ;
while (<MyFile>){
push (@wordList, $_);
}
close(MyFile);
my $outFile = '/Users/jegan/Playground/wordle/please-Score-list';
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
		foreach my $listWord (@listWordArray) {
			$loopTwoCount++;
			#print "Foreach 2 count:" . $loopTwoCount . " " .  $listWord;
			print "List Word is " . $listWord;
			sleep 1;
			chomp $listWord;
			#Compare if is the same word,if so skip;
				if ($scoreWord eq $listWord) {
				#print "Word is " . $scoreWord . " listword is " .  $listWord . "\n";
				#sleep 1;
					next;
				}
			#print "Foreach 2 count:" . $loopTwoCount . " " .  $listWord;
			#see if any of the letters are in the word;
			foreach $letter (@scoreWordLetters) {
				#print "Foreach 3 " . $letter . "\n";
				$loopThreeCount++;
				#sleep 1;
				print "Letter is " . $letter . " and list word is " .  $listWord . "\n";
					if ($listWord =~ /$letter/) {
							print $listWord . " " . $letter . "\n";
							$wordScore++;			
	
					}	
	
	
			#Split the listword into letters;
			@listWordLetters = split (//, $scoreWord);
			my $listWordFirst = $listWordLetters[0];
			my $listWordSecond = $listWordLetters[1];
			my $listWordThird = $listWordLetters[2];
			my $listWordFourth = $listWordLetters[3];
			my $listWordFifth = $listWordLetters[4];

			if ($listWordFirst = $scoreWordFirst) {
			print $listWordFirst . "\n";
			$exactMatch++;
			#$wordScore++;
			}
			if ($listWordSecond = $scoreWordSecond) {
			$exactMatch++;
			#$wordScore++;
			}
			if ($listWordThird = $scoreWordThird) {
			$exactMatch++;
			#$wordScore++;
			}
			if ($listWordFourth = $scoreWordFourth) {
			$exactMatch++;
			#$wordScore++;
			}
			if ($listWordFifth = $scoreWordFifth) {
			$exactMatch++;
			#$wordScore++;
			}
	
		}
	}
	print $exactMatch . "\n";
	if ($exactMatch == 2){
		$exactMatch = $exactMatch * 2;
	print $exactMatch . "\n";
	end;
	}
		$wordScore += $exactMatch;
		$totalWordScore{$scoreWord} = $wordScore;
	$output = $scoreWord . " : " . $wordScore . "\n";
	printf $fh $output;
	$fh->flush;
	$wordScore = 0;
	$exactMatch = 0;
	$loopTwoCount = 0;
}
close(MyOutFile);
open (NewOutFile, ">>", "/User/jegan/Playground/wordle/ranked-score-list") or die "Cound not open file $!";
foreach $word (sort { $totalWordScore{$a} cmp $totalWordScore{$b} }
                keys %totalWordScore) 
{
    print "$word is $totalWordScore{$word}.\n";
}

#foreach my $score (sort values %totalWordScore) {
#printf MyOurFile $score . "\n";
#}


