% William Breen Prolog quiz 4/27/17
% 
% makeList(+Num, +Element, -List) 
% is true when List is a list of 'Elements' 'Num' long
makeList(0,_,[]).
%makeList(1,X,[X]).
makeList(N,X, [X|SmallList]):- 
    N1 is N-1,
    makeList(N1,X,SmallList).


% prefix(+L1, +L2) is true when L2 starts with all elements of L1
prefix([],_).
prefix([H1|T1],[H2|T2]):-
    H1 = H2,
    prefix(T1,T2).