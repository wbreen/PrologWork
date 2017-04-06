% Dot Product, combining two vectors
% 
% 
% Base Case:
dot([X], [Y], Ans):- Ans is X*Y.

% Recursion:
dot([H1|T1], [H2,T2], Ans):- 
    dot(T1,T2,TDot),
    Ans is H1*H2+TDot.