% ------------------------- Problem Instance --------------------------
% This file is a template for a problem instance: the definition of an
% initial state and of a goal. 

% debug(on).	% need additional debug information at runtime?



% --- Load domain definitions from an external file -------------------

:- ['planner'].
:- ['domain-task4'].


% --- Helper functions -------------------------

isFree(P, S):-
  not(at(_,P,S)).

isConnected(A,B) :-
	isCon(A,B);
	isCon(B,A).

isStraight(A,B) :-
	isStraightH(A,B);
	isStraightH(B,A);
	isConnected(A,B).


% --- Definition of the initial state ---------------------------------

isAgent(agent).

isCon(loc-1-1, loc-2-1).
isCon(loc-2-1, loc-3-1).

isCon(loc-1-2, loc-2-2).
isCon(loc-2-2, loc-3-2).

isCon(loc-1-3, loc-2-3).
isCon(loc-2-3, loc-3-3).

isCon(loc-1-4, loc-2-4).

isCon(loc-1-1, loc-1-2).
isCon(loc-1-2, loc-1-3).
isCon(loc-1-3, loc-1-4).

isCon(loc-2-1, loc-2-2).
isCon(loc-2-2, loc-2-3).
isCon(loc-2-3, loc-2-4).

isCon(loc-3-1, loc-3-2).
isCon(loc-3-2, loc-3-3).

isStraightH(loc-1-1, loc-1-3).
isStraightH(loc-2-1, loc-2-3).
isStraightH(loc-3-1, loc-3-3).

isStraightH(loc-1-2, loc-1-4).
isStraightH(loc-2-2, loc-2-4).

isStraightH(loc-2-2, loc-2-4).

isStraightH(loc-1-1, loc-3-1).
isStraightH(loc-1-2, loc-3-2).
isStraightH(loc-1-3, loc-3-3).


at(agent, loc-3-2,s0).
at(a, loc-2-3,s0).
at(b, loc-2-2,s0).
at(c, loc-2-1,s0).



% --- Goal condition that the planner will try to reach ---------------

goal(S) :-
  at(a, loc-1-2, S),
  at(b, loc-1-3,S),
  at(c, loc-1-1,S).



% ---------------------------------------------------------------------
% ---------------------------------------------------------------------
