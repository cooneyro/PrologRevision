% Q1 (b)

listSum([],0).
listSum(List, Sum) :- listSum(0,List,Sum).
listSum(X,[],X).
listSum(Acc,[H|T],Sum) :- NewA is Acc + H, listSum(NewA,T,Sum).

% (c)

listProd([],_).
listProd(List,P) :- listProd(List,1,P).
listProd([],P,P).
listProd([H|T],Acc,Prod) :- NewA is Acc * H, listProd(T,NewA,Prod).

% (d)

list2N(0,[]).
list2N(X,[X|T]) :- XN is X-1, list2N(XN,T),!.

% (e)

nonInc([_]).
nonInc([H,M|T]) :- H >= M, nonInc([M|T]),!.

% (f)

sumList(0,[]).
sumList(N, [X|L]) :- list2N(N, List), member(X, List), Nnew is N-X, sumList(Nnew, L), nonInc([X|L]).





% Q2 (a)

subset([],_).
subset([H|T],L) :- member(H,L), subset(T,L).

% (b)

setEq(X,L) :- subset(X,L), subset(L,X).

% (c)

setEq2(L1,L2) :- setof(C, member(C, L1),S), setof(B, member(B,L2),S).

% (d)

nonmember(_,[]).
nonmember(X,[H|T]) :- nonmember(X,T), X \= H.


% (e)

setInt([],X,X).
setInt(X,[],X).
setInt([H|T],List2, ListBoth) :- member(H,List2), nonmember(H,ListBoth), setInt(T,List2,[H|ListBoth]).
setInt([_|T],List2,ListBoth) :- setInt(T,List2,ListBoth).

% (f)

setInt2(L1,L2,LB) :- subset(X,L1), subset(X,L2), setEq2(X,LB).

% (g)

myif(A,B,C) :- A, !, B;C.

% (h)

max(X, [X]).
max(H, [H|T]) :- max(M, T), H >= M.
max(M, [H|T]) :- max(M, T), H < M.

remMax(H, [H|T], T).
remMax(X, [H|T], [H|T2]) :- remMax(X, T, T2).

maxHead(L1, [H|T]) :- max(H, L1), remMax(H, L1, T).

sumOfPowers(X,Y) :- sumOfPowers(X,0,Y).
sumOfPowers(0,Y,Y) :- !.
sumOfPowers(X,Acc,Y) :- 
	XN is X - 1,
	NewAcc is Acc + X**X,
	sumOfPowers(XN,NewAcc,Y).


sop(N, R) :- sop(N, 0, R).
sop(0, R, R) :- !.
sop(N, Acc, R) :-
    NewN is N - 1,
    NewAcc is Acc + N**N,
    sop(NewN, NewAcc, R).