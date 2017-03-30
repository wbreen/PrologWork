% First List Programs
% 

% "+" for things you intend to be inputs, "-" for things supposed to be inputs
% Don't actually have to write most of these methods, as they are predefined
% Default for prolog is 0

% member(+E, +L) is true when E is a member of list L.
member(E,[E|_]).
member(E,[_|T]):-member(E,T).

antiMember(E,L):- not(member(E,L)).

% length(+L, -Len) is true when Len is length of list L.
length2([],0).
length2([_|T],Ans):- length2(T,Taillength), Ans is Taillength + 1.

% max(+L, -Max) is true when L is a list of numbers and Max is the biggest
% one in the list

max([X], X).
max([H|T],Tailmax):- max(T,Tailmax), Tailmax > H.
max([H|_],H).

% append(+L1, +L2, -L3) is true when L3 is the concatenation of L1 and L2
append([],L2,L2).
append([H|T],L2,[H|L3]):-append(T,L2,L3).
%Say things as statements in head, not telling the computer what to dl
% "THIS IS TRUE"