%Question 1
%(c)
split(_,[],[],[]).
split(N,[H|T],[H|Small],Big) :- H<N , split(N,T,Small,Big).
split(N,[H|T],Small,[H|Big]) :- H>=N, split(N,T,Small,Big). 

%(d)

sop(N, R) :- sop(N, 0, R).
sop(0, R, R) :- !.
sop(N, Acc, R) :-
    NewN is N - 1,
    NewAcc is Acc + N**N,
    sop(NewN, NewAcc, R).

%Question 2
%(a)
mem(X,X).
mem(X,[X|_]).
mem(X,[_|Tail]) :- mem(X,Tail).

%(b)
%Red cut because different output

%(c)
lst(X,[X]).
lst(X,[_|Tail]) :- lst(X,Tail).

%(d)
mult(X,[X|Tail]) :- mult2(X,Tail).

mult2(X,[X|_]).
mult2(X,[_|Tail]) :- mult2(X,Tail).

%(e)
nxt(A, B, [A,B|_]).
nxt(A, B, [_|T]) :- nxt(A,B,T).

%(f)
%next3(A1,A2,A3,B1,B2,B3,L1,L2,L3)
% backtrack from list L3
next3(A1,A2,A3,A1,A2,B3,L1,L2,L3) :- mem3(A1,A2,A3,L1,L2,L3), nxt(A3,B3,L3).

% backtrack from list L2
next3(A1,A2,Z3,A1,B2,A3,L1,L2,L3) :- mem3(A1,A2,Z3,L1,L2,L3), lst(Z3,L3), first(A3,L3), nxt(A2,B2,L2).

% backtrack from list L1
next3(A1,Z2,Z3,B1,A2,A3,L1,L2,L3) :- mem3(A1,Z2,Z3,L1,L2,L3), lst(Z2,L2), lst(Z3,L3), first(A2,L2),
                                      first(A3,L3), nxt(A1,B1,L1).

%Q3(d)

mkList(0, []) :- !.
mkList(V, [V|L]) :- VV is V-1, mkList(VV, L).
s(V) --> {V >= 1, VV is V*2, mkList(VV, L)}, gen(L, VV).
gen(L, V) --> {V >= 0, member(X, L), VV is V-X}, [X], gen(L, VV).
gen(_, 0) --> [].