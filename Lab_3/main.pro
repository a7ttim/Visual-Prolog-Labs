% A7ttim

implement main
    open core

clauses
    run() :-
        %graph::start(['a', [['b', []], ['c', []], ['d', []]]], ['b', ['a', []]]),
        succeed.  % place your own code here

end implement main

% A7ttim

class graph

domains
    tree = tree(char, char*).

end class

implement graph

clauses
    edge('a', 'b').
    edge('b', 'd').
    edge('b', 'd').
    edge('b', 'd').
    edge('b', 'd').

clauses

    not_used_node([], _, []).
    not_used_node([Node | Maybe], Used, NotUsed) :-
        member(Node, Used),
        not_used_node(Maybe, Used, NotUsed),
        !.
    not_used_node([Node | Maybe], Used, [Node | NotUsed]) :-
        not_used_node(Maybe, Used, NotUsed).

    find_new_node(Current, Used, NewNode) :-
        graph(Current, NextNode),
        not_used_node(NextNode, Used, NewNode).

    bfs([], _, []).
    bfs([Current | Queue], Used, [[Current, Nodes] | Relation]) :-
        find_new_node(Current, Used, Nodes),
        append(Queue, Nodes, NewQueue),
        append(Nodes, Used, NewUsed),
        bfs(NewQueue, NewUsed, Relation).

    get_node(Start, [[Start, Nodes] | _], Nodes).
    get_node(Start, [_ | Tree], Nodes) :-
        get_node(Start, Tree, Nodes),
        !.
    get_node(_, [], _) :-
        fail.

    make_path(End, End, _, [End]).
    make_path(Start, End, Tree, [Start | Result]) :-
        get_node(Start, Tree, Nodes),
        run_make_path(Nodes, End, Tree, Result).

    run_make_path([], _, _, _) :-
        fail.
    run_make_path([Node | _], End, Tree, Result) :-
        make_path(Node, End, Tree, Result).
    run_make_path([_ | Tail], End, Tree, Result) :-
        run_make_path(Tail, End, Tree, Result).

    get_path_middle(Length, _, _) :-
        Length < 2,
        !,
        fail.
    get_path_middle(2, _, []).
    get_path_middle(Length, Path, [First, Second]) :-
        L = Length mod 2,
        L = 0,
        SecondIndex = round(Length / 2),
        FirstIndex = SecondIndex + 1,
        nth(FirstIndex, Path, First),
        nth(SecondIndex, Path, Second).
    get_path_middle(Length, Path, [Middle]) :-
        L = Length mod 2,
        L = 1,
        Index = ceiling(Length / 2),
        nth(Index, Path, Middle).

    path_middle(Start, End, Result) :-
        bfs([Start], [Start], Tree),
        make_path(Start, End, Tree, Path),
        length(Path, Length),
        get_path_middle(Length, Path, Result).

end implement

goal
    console::runUtf8(main::run).
