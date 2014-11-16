% ------------------------- Domain Definition -------------------------
% This file describes a planning domain: a set of predicates and
% fluents that describe the state of the system, a set of actions and
% the axioms related to them. More than one problem can use the same
% domain definition, and therefore include this file


% --- Cross-file definitions ------------------------------------------
% marks the predicates whose definition is spread across two or more
% files
%
% :- multifile name/#, name/#, name/#, ...

:- multifile at/3.


% --- Primitive control actions ---------------------------------------
% this section defines the name and the number of parameters of the
% actions available to the planner
%
% primitive_action( dosomething(_,_) ).	% underscore means `anything'

primitive_action(move(_,_,_)).
primitive_action(push(_,_,_,_,_)).



% --- Precondition for primitive actions ------------------------------
% describe when an action can be carried out, in a generic situation S
%
% poss( doSomething(...), S ) :- preconditions(..., S).

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



% --- Successor state axioms ------------------------------------------
% describe the value of fluent based on the previous situation and the
% action chosen for the plan. 
%
% fluent(..., result(A,S)) :- positive; previous-state, not(negative)

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
    A = move(Object, _, Loc) %Object moved to loc
;
    A = push(_, Object, _, _, Loc) %Object got pushed to loc
;
    A = push(Object,_ , _, Loc, _) %Object pushed something off loc, taking it's place
	.

% ---------------------------------------------------------------------
% ---------------------------------------------------------------------
