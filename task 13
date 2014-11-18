isHittingSetTree(Tree):-
	Tree = node([],_);
	Tree = node([X],_), isHittingSetTree(X);
	Tree = node([H|T],_), isHittingSetTree(H), isHittingSetTree(T).
