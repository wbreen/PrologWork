exampleLists(single, [1]).
exampleLists(list, [1,2,3,4,5,6,7,8,9,0]).

% Get the last element of a list
% Base case
lastElement([Head|[]], LastElement):- LastElement is Head.
% Recursion
lastElement([_|ListTail], LastElement):- lastElement(ListTail, LastElement).

% Get the reverse of a list +[original], -[reversed]
% Base Case
reverseList([Head|[]], [Reversed]):- Reversed is Head.
% Recursion
reverseList([OriginalH|OriginalT], ReverseFinal):- 
    append(ReversedT, [OriginalH], ReverseFinal),
    reverseList(OriginalT, ReversedT).

% Number of even integers in a list
% Base Case(s?)
numEvens([EvenH|[]], Out):- 0 is mod(EvenH, 2), Out is 1.
numEvens([OddH|[]], Out):- 1 is mod(OddH, 2), Out is 0.
% Recursion
numEvens([Head|Tail], Output):- 
    numEvens(Tail, SmallerSum),
    ValHead is mod(Head+1, 2),
    Output is ValHead + SmallerSum.

% List of the first N even integers +num, -List
% Base Case
firstNEvens(0,[]).
firstNEvens(1,[2]).
% Recursion
firstNEvens(Num, Output):-
    OneLess is Num-1,
    firstNEvens(OneLess, OneLessList),
    Doubled is Num*2,
    append(OneLessList, [Doubled], Output).