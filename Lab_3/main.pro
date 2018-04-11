% A7ttim

implement main
    open core

clauses
    run() :-
        graph::start(),
        _ = console::readLine().

end implement main

% A7ttim

class graph

domains
    tree =
        tree(char, tree, tree);
        empty.

predicates
    print_tree : (tree).
    comp_tree : (tree, tree).
    %add_edges : (treetype, edge).
    start : ().

end class

implement graph

class facts
%current : treetype := tree('d', tree('b', tree('a', empty, empty), tree('c', empty, empty)), tree('e', empty, empty)).
%13.	Напишите программу, на вход которой подаются два дерева. Программа должна проверять, изоморфны ли данные деревья
% (Два дерева называются изоморфными, если можно отобразить одно из них в другое, изменением порядка ветвей в поддеревьях).

clauses
    print_tree(empty) :-
        !.
    print_tree(tree(Root, Left, Right)) :-
        stdio::write(Root, "\n"),
        print_tree(Left),
        print_tree(Right).
    comp_tree() :-
        fail.
    comp_tree(empty, empty).
    comp_tree(empty, tree(_, _, _)) :-
        fail.
    comp_tree(tree(_, _, _), empty) :-
        fail.
    comp_tree(tree(V, LL, LR), tree(V, RL, RR)) :-
        comp_tree(LL, RL),
        !,
        comp_tree(LR, RR).
    comp_tree(tree(V1, _, _), tree(V2, _, _)) :-
        V1 \= V2,
        fail.
    start() :-
        %print_tree(tree('a', tree('b', empty, empty), tree('c', empty, empty))),
        %print_tree(tree('c', tree('a', tree('b', empty, empty), empty), empty)).
        comp_tree(tree('a', tree('b', empty, empty), tree('c', empty, empty)), tree('c', tree('a', tree('b', empty, empty), empty), empty)).

end implement

goal
    console::runUtf8(main::run).
