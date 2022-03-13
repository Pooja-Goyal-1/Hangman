#!/usr/local/bin/perl

@wordlist=("computer", "radio", "calculator", "teacher", "bureau", "police", "geometry", "president", "subject", "country",
       "enviroment", "classroom", "animals", "province", "month", "politics", "puzzle", "instrument", "kitchen", 
	   "language", "vampire", "ghost", "solution", "service", "software", "virus", "security", "phonenumber", "expert",
	   "website", "agreement", "support", "compatibility", "advanced", "search", "triathlon", "immediately", "encyclopedia",
	   "endurance", "distance", "nature", "history", "organization", "international", "championship", "government", "popularity",
	   "thousand", "feature", "wetsuit", "fitness", "legendary", "variation", "equal", "approximately", "segment", "priority",
	   "physics", "branch", "science", "mathematics", "lightning", "dispersion", "accelerator", "detector", "terminology", "design", 
	   "operation", "foundation", "application", "prediction", "reference", "measurement", "concept", "perspective", "overview", "position", 
	   "airplane", "symmetry", "dimension", "toxic", "algebra", "illustration", "classic", "verification", "citation", "unusual", 
	   "resource", "analysis", "license", "comedy", "screenplay", "production", "release", "emphasis", "director", "trademark", 
	   "vehicle", "aircraft", "experiment");
	   
# selecting a random word from the list of words given above
$index=int rand(99); 

# storing the word selected and converting it into uppercase
$word=uc($wordlist[$index]); 


# Sub-routines used

#the display() subroutine that displays the hangman
sub displayHangman
{ 
	($choice)=@_;
	
	if ($choice==0) {
	print "---------------- \n";
	print "|              | \n";
	print "| \n";
	print "| \n";
	print "| \n";
	print "|  ";
	print "\n|\n";
	print "| \n"; }

	elsif ($choice==1) {
	print "---------------- \n";
	print "|              | \n";
	print "|              O \n";
	print "| \n";
	print "| \n";
	print "|  ";
	print "\n|\n";
	print "| \n"; }

	elsif ($choice==2){
	print "---------------- \n";
	print "|              | \n";
	print "|              O \n";
	print "|              |   \n";
	print "|              |  \n";
	print "|              ";
	print "\n|\n";
	print "| \n" ;}

	elsif ($choice==3) {
	print "---------------- \n";
	print "|              | \n";
	print "|              O \n";
	print "|             \\|   \n";
	print "|              |  \n";
	print "|              ";
	print "\n|\n";
	print "| \n"; }

	elsif ($choice==4){
	print "---------------- \n";
	print "|              | \n";
	print "|              O \n";
	print "|             \\|/   \n";
	print "|              |  \n";
	print "|              ";
	print "\n|\n";
	print "| \n";}

	elsif ($choice==5){
	print "---------------- \n";
	print "|              | \n";
	print "|              O \n";
	print "|             \\|/   \n";
	print "|              |  \n";
	print "|             /  ";
	print "\n|\n";
	print "| \n";}

	elsif ($choice==6) {
	print "---------------- \n";
	print "|              | \n";
	print "|              O \n";
	print "|             \\|/   \n";
	print "|              |  \n";
	print "|             / \\ ";
	print "\n|\n";
	print "| \n";
	}
		
}
	
	
#subroutine that prints the current status of the word
sub PrintCurrentWord
{
	($currentWord)=@_;
	
	foreach (@$currentWord){
		print "$_ ";
	}
	
	print "\n";
}
	
	
#subroutine that prints all the earlier guesses
sub PrintGuessedLetters
{
	($guessedLetters)=@_;
	
	print "THE LETTERS GUESSED SO FAR: ";
	foreach(@$guessedLetters){
		print "$_ ";
	}
	
	print "\n";
}
	
	
#subroutine that checks if the entered letter has been guessed earlier or not
sub CheckIfAlreadyGuessed
{
	my ($alreadyGuessedLetters, $guess) = @_;
	my $flag=0;
	
	#checking if input letter has been guessed earlier or not	
	foreach ( @$alreadyGuessedLetters) 
	{
		if($_ eq $guess){
			$flag+=1;
		}
		
	}
	   
	return $flag;
}
	
	
#check if the inputted letter occurs in the main word
sub CheckLetter
{
	$letters=$_[0];
	$res=$_[1];
	
	$len=$_[4];
	
	$count=0;
	
	foreach $i (0..$len-1)
	{
		#checking if input letter occurs in the original word 
		if($letters->[$i] eq $_[2]) 
		{
			#updating number of times any letter is guessed correct overall in all guesses
			$_[3]+=1; 
			
			#counting the number of times guessed letter occurs in word
			$count+=1; 
			
			#updating resulant word with the guessed correct letter in correct places
			$res->[$i]=$_[2]; 
		}
		
	}
	   
	return $count;
}




$len=length($word);
@letters=(); 

#storing the individual letters of the selected word
for $character (split //, $word)
{
	push @letters, $character; 
}

$correct=0;
$wrongGuesses=0;

@res=(); 
@guessed=();


#Replacing all the unguessed letters as '_'.
foreach $_ (1..$len) 
{
	push @res, '_';
}

print "Welcome to the game: HANGMAN.\n Guess the word. \n You will loose if you make 6 wrong guesses\n";
displayHangman("0");

while($correct<$len && $wrongGuesses<6)
{
	print "\n\nWORD: ";
	
	#subroutine that prints the current status of word 
	PrintCurrentWord(\@res);  
	
	#subroutine that displays the guesses made by user so far.
	PrintGuessedLetters(\@guessed);  
	
	print "Enter your guess ?";
	#taking user input
	$input=<STDIN>;  
	
	$guess=uc($input);
	
	#removing the last trailing newline from the input string
	$A=chomp($guess);
	
	#subroutine checks if letter entered has been entered earlier or not
	$isAlreadyGuessed= &CheckIfAlreadyGuessed(\@guessed, $guess); 
	
	
	#if the letter taken as input has already been guessed once
	if ($isAlreadyGuessed>0) 
	{
	    print "You've already entered $guess !\n";
		$isAlreadyGuessed=0;
		next;
	}
	else
	{
		push @guessed, $guess;
	}
	
	#if user enters the entire correct word as guess
	if($guess eq $word) 
	{
		print "\nYou guessed the correct word $word!";
		exit;
	}
	
	#subroutine checks if entered letter is in the word
	$count= &CheckLetter(\@letters, \@res, $guess, $correct, $len); 
	
	#if the letter guessed doesn't occur in the original word
	if($count==0) 
	{
		$wrongGuesses=$wrongGuesses + 1;
		print "Wrong guess!";
	}
	else
	{
		print "Good guess!";
	}
	
	#counting number of wrong attempts left
	$left=6-$wrongGuesses;  
	print " You have $left body parts left.\n";
	#display() subroutine displays the current hangman
	displayHangman($wrongGuesses); 
	
	$count=0;

}

#if user has made 6 incorrect letter guesses
if($wrongGuesses==6) 
{
	print "\nOops. You lost .\nThe correct word was $word. \nBetter luck next time";
}

#if all the letters have been guessed correctly, one by one
elsif ($correct==$len) 
{
	print "\nYou guessed the correct word $word !";
}
