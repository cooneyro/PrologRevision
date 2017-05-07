% Q1

add2(X,-Y,Z) :- minus(Y,A), add2(X,A,Z).
add2(-X, Y, Z) :- minus(X, A), add2(A,Y,Z).
add2(X,Y,Z) :- getS(X, X1), getS(Y, Y1), add(X1, Y1, ZS), getP(X,X2), getP(Y,Y2), add(X2,Y2,ZP), add(ZS, ZP,Z).

getS(0,0).
getS(s(X), s(Y)) :- getS(X, Y).
getS(p(X), Y) :- getS(X, Y).
getS(X+Y, Z) :- getS(X, X1), getS(Y, Y1), add(X1, Y1, Z).

getP(0,0).
getP(p(X), p(Y)) :- getP(X, Y).
getP(s(X), Y) :- getP(X, Y).
getP(X+Y, Z) :- getP(X, X1), getP(Y, Y1), add(X1, Y1, Z).

subtract(X, Y, Z) :- minus(Y, A), add2(X, A, Z).

minus(X,Y) :- add2(X,0,A), negate(A,Y).

negate(0,0).
negate(p(X),s(Y)) :- negate(X,Y).
negate(s(X),p(Y)) :- negate(X,Y).



% Q2 (a)

if-then-else(A,B,C) :- A , !, B;C.

% (b)

no-duplicates([],_).
no-duplicates([H|T], List2) :- member(H,List2), no-duplicates(T,List2).
no-duplicates([H|T], List2) :- nonmember(H,List2), no-duplicates(T,[H|List2]).

nonmember(_,[]).
nonmember(X,[H|T]) :- nonmember(X,T), X \= H. 

% (c)

minus(X,[],X).
minus([],_,[]).
minus([H|T],List,Result) :- member(H,List) , minus(T,List,Result).
minus([H|T],List,[H|Result]) :- \+member(H,List), minus(T,List,Result).

% (d)

connected(A,A).