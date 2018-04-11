% A7ttim

implement main
    open core

domains
    tree =
        tree(char, tree, tree);
        empty.

predicates
    print_tree : (tree).
    comp_tree : (tree, tree).
    %add_edges : (treetype, edge).
    start : ().

clauses
    run() :-
        succeed. % place your own code here

end implement main

goal
    console::runUtf8(main::run).