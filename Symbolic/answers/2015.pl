%CS3011 Exam Paper Solutions 2015
%Q1
%c) split(N,List,Small,Big)
split(_, [], [], []).
split(N, [H|T], [H|Small], Big) :- H < N, split(N, T, Small, Big).
split(N, [H|T], Small, [H| Big]) :- H >= N, split(N, T, Small, Big).
%d) sumOfPowers(N, SoP)
sumOfPowers(N, Sum) :- sop(N, Sum, 0).

sop(0, X, X).
sop(X, Sum, S) :- Snew is S+(X**X), Xnew is X-1, sop(Xnew, Sum, Snew).

%Q2
%a) member(X,List)
member(X, [X|_]).
member(X, [H|T]) :- member(X, T).
%c) last(X,List)
last(X, [X]).
last(X, [_|T]) :- last(X, T).
%d) multiple(X,List)
multiple(X, [X|T]) :- member(X, T).
multiple(X, [_|T]) :- multiple(X, T). 
%e) next(A,B,List)
next(A, B, [A,B|_]).
next(A, B, [_|T]) :- next(A,B,T).
%f) next3(A1,A2,A3,B1,B2,B3,L1,L2,L3)
% TO-DO

%Q3
%a)
s --> [2].
s --> l(Ones), [2], r(Zeros), {Ones is 2*Zeros}.
l(0) --> [].
l(Ones) --> [1], l(O), {Ones is O+1}.
l(Ones) --> [0], l(Ones).
r(0) --> [].
r(Zeros) --> [0], r(Z), {Zeros is Z+1}.
r(Zeros) --> [1], r(Zeros).

%c)
s2(A,B) :- A-B is [2].
s2(A,D) :- l2(Ones, A, B), B=[2|C], r2(Zeros, C, D), Ones is 2*Zeros.

l2(0,A,A).
l2(Ones, A, C) :- A=[1|B], l2(O, B, C), Ones is O+1.
l2(Ones,A,C) :- A=[0|B], l2(Ones, B, C).

r2(0,A,A).
r2(Zeros, A, C) :- A=[0|B], r2(Z, B, C), Zeros is Z+1.
r2(Zeros,A,C) :- A=[1|B], r2(Zeros,B,C).

%d)
%mkList(+Num, ?List)
mkList(0, []).
mkList(N, [N|List]) :- Nnew is N-1, Nnew >= 0, mkList(Nnew, List).

%double(0) --> [].
double(0, B, B).
%double(C) --> {mkList(C, L), member(X, L), Cnew is C-X}, [X], double(Cnew).
double(C, A, D) :- mkList(C,L), member(X,L), Cnew is C-X, A=[X|B], double(Cnew, B, D).

s3(C, A, B) :- C2 is C*2, double(C2, A, B).