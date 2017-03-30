% In class practice problems

% Question 1, series
% series(+N, -Ans) is true when Ans is the Nth number in the series: 3,7,15,31...
series(1,3).
series(N,Ans):- N1 is N-1, series(N1, N1thNumber), Ans is N1thNumber*2+1.


% Question 2, scalar multiplication
% scalarMult([2,7,4],3,Result).
% should yield  Result = [6,21,12]
% 
% THIS IS BASE CASE, NEED TO WRITE FOR MORE THAN ONE CASE
scalarMult([X],S,[Z]):- Z is X*S.
% head of list * scalar, then append that to list
%scalarMult(