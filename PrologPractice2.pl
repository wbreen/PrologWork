% Question 2, Scalar Multiplication
% scalarMult([2,7,4],3,Result).
% should yield  Result = [6,21,12]
% 
% scalarMult(+X, +S, -Z) is true when Z is a list of all X multiplied by S
% Base Case:
scalarMult([X],S,[Z]):- Z is X*S.
% Recursion:
scalarMult([XH|XT], S, Result):- 
    scalarMult(XT, S, SmallerList),
    NewHead is XH*S,
    append([NewHead], SmallerList, Result).