% A7ttim

implement main
    open core

clauses
    run() :-
        graph::start(['a', [['b', []], ['c', []], ['d', []]]], []),
        succeed.  % place your own code here

end implement main

% A7ttim

class graph

predicates
    start : (char*, char*).

end class

implement graph

class facts
    edge : (char Value, char Value) determ.
class clauses


end implement

goal
    console::runUtf8(main::run).
