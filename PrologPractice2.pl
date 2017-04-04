% Question 2, Scalar Multiplication
% scalarMult([2,7,4],3,Result).
% should yield  Result = [6,21,12]
% 
% scalarMult(+X, +S, -Z) is true when Z is a list of all X*S
% Base Case:
scalarMult([X],S,[Z]):- [H|_]=X, Z is H*S.
% Recursion:
scalarMult([X],S,[Z]):- X[XH|XT]=X,
    NewZ is XH*S,
    append(NewZ,Z),
    scalarMult(XT,S,[Z]).
