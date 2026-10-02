% Gender facts
male(abraham).
male(homer).
male(clancy).
male(bart).
female(mona).
female(marge).
female(jackie).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parent facts
parent(abraham, homer).
parent(mona, homer).
parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).
parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).
parent(selma, ling).


% Father
father(X, Y) :-
    parent(X, Y),
    male(X).

% Mother
mother(X, Y) :-
    parent(X, Y),
    female(X).

% Son
son(X, Y) :-
    parent(Y, X),
    male(X).

% Daughter
daughter(X, Y) :-
    parent(Y, X),
    female(X).

% Brother
brother(X, Y) :-
    parent(P, X),
    parent(P, Y),
    male(X),
    X \= Y.

% Sister
sister(X, Y) :-
    parent(P, X),
    parent(P, Y),
    female(X),
    X \= Y.

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Grandfather
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% Aunt
aunt(X, Z) :-
    sister(X, Y),
    parent(Y, Z).

% Uncle
uncle(X, Z) :-
    brother(X, Y),
    parent(Y, Z).

% Cousin
cousin(X, Z) :-
    parent(P1, X),
    parent(P2, Z),
    sibling(P1, P2).

% Ancestor
ancestor(X, Z) :-
    parent(X, Z).

ancestor(X, Z) :-
    parent(X, Y),
    ancestor(Y, Z).
