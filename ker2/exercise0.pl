/* The facts about the Dutch Royal Family */

mother(wilhelmina, juliana).
mother(juliana, beatrix).
mother(juliana, christina).
mother(juliana, irene).
mother(juliana, margriet).
mother(beatrix, friso).
mother(beatrix, alexander).
mother(beatrix, constantijn).
mother(emma, wilhelmina).

father(hendrik, juliana).
father(bernard, beatrix).
father(bernard, christina).
father(bernard, irene).
father(bernard, margriet).
father(claus, friso).
father(claus, alexander).
father(claus, constantijn).
father(willem, wilhelmina).

queen(beatrix).
queen(juliana).
queen(wilhelmina).
queen(emma).
king(willem).

/* rules */

parent(X, Y) :- mother(X, Y).
parent(X, Y) :- father(X, Y).

ruler(X) :- queen(X).
ruler(X) :- king(X).

predecessor(X, Y) :-
   parent(X, Y),
   ruler(X),
   ruler(Y).
predecessor(X, Y) :-
   ruler(X),
   parent(X, Z),
   predecessor(Z, Y).
