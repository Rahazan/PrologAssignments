isBinaryTree(X):-
	isLeaf(X);
	isBinaryNode(X).


isBinaryNode(X):-
	X=node((Y,Z),(Number) ),
	isBinaryTree(Y),
	isBinaryTree(Z).

isLeaf(leaf(Number)).

nnodesBinary(Tree, N):-
	isLeaf(Tree), N=1;
	Tree = node(X,Y),
	nnodes(X,M), nnodes(Y,L),N is 1+M+L.

makeBinary(N,Tree):-
	N=0, Tree = leaf(0);
	N>0, N1 is N-1, Tree = node( (makeBinary(N1,  T), makeBinary(N1, T)),N).

isTree(node(X,Y)):-
	isNode(X).

isNode(X):-
	X=[];
	X=[H|T], isTree(H), isNode(T).

nnodes(node(Tree,_),N):- nnodes(Tree,N1), N is N1 + 1.
nnodes([],0).
nnodes([H|T],N):-
nnodes(H,N1),nnodes(T,N2), N is N1 + N2.
