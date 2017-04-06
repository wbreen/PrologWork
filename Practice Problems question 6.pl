% construct a path from one node to another
edge(a,b).
edge(a,d).
edge(b,c).
edge(c,e).
edge(b,e).
edge(d,e).
edge(d,g).
edge(d,f).
edge(f,g).
edge(g,h).

%Base cases:
%Two options
path(X,X,[X]).
% OR
path(X,X,[X,Y]):-edge(X,Y).

% Recursion:
% Way 1: Start at the end
path(X,Y,AnsPath):-
    edge(Z,Y),
    path(X,Z,Path),
    append(Path, [Y], AnsPath).
% Way 2: (Shannons way)
path(X,Y,[X|Path]):- 
    edge(X,Z),
    path(Z,Y,Path).