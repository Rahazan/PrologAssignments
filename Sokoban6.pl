:- ['planner'].

poss( move(Object, From, To), S):-
  isAgent(Object),
  at(Object, From, S),
  isConnected(From, To),
  isFree(To, S).

poss(push(Agent, Object, AgentPos, From, To), S):-
  isAgent(Agent),
  at(Object, From, S),
  isConnected(From, To),
  isConnected(AgentPos, From),
  at(Agent, AgentPos, S),
  isStraight(AgentPos, To),
  isFree(To, S).



at(Object, Loc, result(A,S)) :-
        at(Object, Loc, S)
   ,
	  not(
                %Object moved away
                A = move(Object, Loc, _)
            ;
                %Something pushed object away
	  A = push(_, Object, _,  Loc, _)
            ;	  %Object pushed something, moving the object too
                A = push(Object, _, Loc, _, _)
	  )

;
    A = move(Object, _, Loc)
;
    A = push(_, Object, _, _, Loc)
;
    A = push(Object,_ , _, Loc, _)
	.

%-----

primitive_action(move(_,_,_)).
primitive_action(push(_,_,_,_,_)).


isFree(P, S):-
  not(at(_,P,S)).

isConnected(A,B) :-
	isCon(A,B);
	isCon(B,A).

isStraight(A,B) :-
	isStraightH(A,B);
	isStraightH(B,A);
	isConnected(A,B).


%------------------------------------------------
%FACTS
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

box(a).
box(b).
box(c).

at(agent, loc-3-1,s0).
at(a, loc-2-3,s0).
%at(b, loc-2-2,s0).
at(c, loc-2-1,s0).

goal(S) :-
  at(a, loc-2-2, S),
  at(agent, loc-3-3,S),
  at(c, loc-3-1,S).
