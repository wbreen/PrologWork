% Evan Elkin

word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(anagram,a,n,a,g,r,a,m).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).
word(enhance,e,n,h,a,n,c,e).

solution(H1, H2, H3, V1, V2, V3):-
    word(H1,_,A,_,B,_,C,_),
    word(H2,_,D,_,E,_,F,_),
    word(H3,_,G,_,H,_,I,_),
    word(V1,_,A,_,D,_,G,_),
    word(V2,_,B,_,E,_,H,_),
    word(V3,_,C,_,F,_,I,_).

edge(a,b).
edge(b,c).
edge(b,d).
edge(c,d).

path(X,Y):- edge(X,Y).
path(X,Y):- edge(X,Z), path(Z,Y).

%s(N,X) is true when X is the Nth number of the
%sequence 7, 10, 13, ...

s(1,7).
s(N, X1):- N1 is N-1, s(N1,X), X1 is X+3.

%addUp(L,Sum) is true when when Sum is the sum of the
%numbers in list L.
addUp([],0).
addUp([H|T], Sum):-addUp(T,TSum), Sum is TSum + H.
