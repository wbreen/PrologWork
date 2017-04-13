% This top-level predicate runs the game.  It prints a 
% welcome message, picks a phrase, and calls getGuess.

hangman:- getPhrase(Ans), !, write('Welcome to hangman.'),nl,
	name(Ans,AnsList), makeBlanks(AnsList, BlankList), 
	getGuess(AnsList,BlankList).

% Randomly returns a phrase from the list of possibilities.
getPhrase(Ans):- phrases(L), length(L, X), R is random(X), N is R +1, getNth(L, N, Ans).

% Possible phrases to guess.
phrases(['a_picture_is_worth_a_thousand_words','one_for_the_money','dead_or_alive','computer_science']).

% Asks the user for a letter guess.  Starts by writing the 
% current "display phrase" with blanks, then asks for a guess and
% calls process on the guess.
 
getGuess(AnsList, Blanks):- name(BlankName, Blanks), write(BlankName), nl,  
	write('Enter your guess, followed by a period and return.'), nl, read(Guess),!, 
	name(Guess, [GuessName]), processGuess(AnsList,Blanks,GuessName).

% Process guess takes a list of codes representing the answer, a list of codes representing the current
% "display phrase" with blanks in it, and the code of the letter that was just guessed.  If the guess
% was right, call substitute to put the letter in the display phrase and check for a win.  Otherwise, just
% get another guess from the user.

processGuess(AnsList,Blanks,GuessName):- 
	member(GuessName,AnsList), !, write('Correct!'), nl, 
	substitute(AnsList, Blanks,GuessName, NewBlanks), 
	checkWin(AnsList,NewBlanks).

processGuess(AnsList, Blanks,_):- write('Nope!'), nl, getGuess(AnsList, Blanks).

% Check to see if the phrase is guessed.  If so, write 'You win' and if not, go back and get another guess.

checkWin(AnsList, Blanks):- name(Ans, AnsList), name(BlankName, Blanks), 
	BlankName = Ans, !, write('You win!').
checkWin(AnsList, Blanks):- !, getGuess(AnsList, Blanks).
% Stuff for you to Write

% getNth(L,N,E) should be true when E is the Nth element of the list L. N will always
% be at least 1.
% getNth(+List, +ElementNum, -NthElement)
getNth([H|_], N, E):- N is 1, E = H.
% Recursion:
getNth([_|T], N, E):- 
    SmallN is N-1,
    getNth(T, SmallN, Smaller),
    E = Smaller.


% makeBlanks(Answer, Display) should take an answer phrase, which is a list
% of character codes that represent the answer phrase, and return a list
% where all codes but the '_' turn into the code for '*'.  The underscores
% need to remain to show where the words start and end.  Please note that 
% both input and output lists for this predicate are lists of character codes.
% You can test your code with a query like this:
% csc_is_awesome
% ___csc_is_super_mind_bending___
%  testMakeBlanks:- name('csc_is_awesome', List), makeBlanks(List, Display), name(Towrite, Display), write(Towrite). 

%makeBlanks(+AnswerCodes, -DisplayCodes)
%  Base Cases:
makeBlanks([H], Display):- 
    name(Letter, [H]),
    Letter = '_',
    name(Letter, Display).
makeBlanks([H], Display):-
    name(Letter, [H]),
    Letter \= '_',
    name('*', Display).
% Recursion:
makeBlanks([H|T], DispOut):-
    makeBlanks([H], DispHead),
    makeBlanks(T, DispTail),
    append(DispHead, DispTail, DispOut).


%substitute(+AnsList, +Display, +Guess, -NewDisplay) Takes character code lists AnsList and Display, 
% and Guess, which is the character code for the guessed letter.  The NewDisplay should again be a 
% character code list, which puts all the guesses into the display word and keeps the *'s and _'s otherwise.
% For example, if the answer is 'csc_is_awesome' and the display is 'c*c_**_*******' and the guess is 's', the 
% new display should be 'csc_*s_***s***'.  
% You can test your predicate with a query like this:
% 
% csc_is_awesome --> c*c_**_*******
testSubstitute:- name('csc_is_awesome', AnsList), name('c*c_**_*******', Display), name('s',[Guess]),
 substitute(AnsList, Display, Guess, NewDisp),
	name(Towrite, NewDisp), write(Towrite). 
%	
% Also, since the predicate doesn't deal directly with character codes, this should also work:
% substitute(['c','s','c'],['c','*','c'],'s',L).  L should be ['c','s','c'].

% Base Case:
substitute([],[],_,[]).
% 	The guess is in the answer list
%substitute([AnsL|_], [_], Guess, NewDisp):-
%    name(AnswerLetter, [AnsL]),
%    name(GuessLetter, [Guess]),
%    AnswerLetter == GuessLetter,
%    NewDisp is Guess.
% 	The guess is not in the answer list
%substitute([AnsL|_], [OldDisp|_], Guess, NewDisp):-
    %AnsL \= Guess,
%    name(AnswerLetter, [AnsL]),
%    name(GuessLetter, [Guess]),
%    AnswerLetter \= GuessLetter,
%    NewDisp is OldDisp.
% Recursion:
substitute([AnsH|AnsT], [_|OldT], Guess, [AnsH|NewDisplay]):- 
    Guess = AnsH,
    substitute(AnsT, OldT, Guess, NewDisplay).
substitute([AnsH|AnsT], [OldH|OldT], Guess, [OldH|NewDisplay]):-
    Guess \= AnsH,
    substitute(AnsT, OldT, Guess, NewDisplay).




























