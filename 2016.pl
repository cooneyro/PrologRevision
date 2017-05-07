% 2016 Q1(b)

isSet([]).
isSet([H|T]) :- not(member(H,T)),isSet(T). 

% (c)

moreThanOne(List) :- moreThanOne(List, []).
moreThanOne([], L) :- length(L, X), X>1.
moreThanOne([H|T], []) :- moreThanOne(T, [H]).
moreThanOne([H|T], L) :- member(H, L) -> moreThanOne(T, L); moreThanOne(T, [H|L]).


% (d)

moreThan(List, Num) :- moreThan(List, Num, []).
moreThan([], Num, X) :- length(X, Length), Length > Num.
moreThan([H|T], Num, []) :- moreThan(T, Num, [H]).
moreThan([H|T], Num, L) :- member(H, L) -> moreThan(T, Num, L); moreThan(T, Num, [H|L]).

%Question 2 
%(a(i))
fac(0,1). 
fac(X,N) :- Y is X-1, fac(Y,XN), N is XN*X.

%(a(ii))
fact(X,F) :- factor(X,1,F).

factor(0,F,F).
factor(N,A,F) :- AA is N*A,
				 NN is N-1,
				 factor(NN,AA,F).

%(b(i))
fib(0,1).
fib(1,1).
fib(N,F) :- N2 is N-2,
			fib(N2,FF),
			N1 is N-1,
			fib(N1,FFF),
			F is FFF + FF.			 

%(b(ii))
fibo(0,_,F,F).
fibo(N,P1,P2,F) :- NN is N-1,
				   FF is P1+P2,
				   fibo(NN,P2,FF,F).

fibRec(N,F) :- fibo(N,0,1,F).