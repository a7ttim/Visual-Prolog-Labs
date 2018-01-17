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
    treetype =
        tree(char, treetype, treetype);
        nil.
    edgetype = edge(char, char).

predicates
    print_tree : (treetype).
    add_edges : (treetype, edge).
    start : ().

end class

implement graph

class facts
%current : treetype := tree('d', tree('b', tree('a', nil, nil), tree('c', nil, nil)), tree('e', nil, nil)).
%13.	Напишите программу, на вход которой подаются два дерева. Программа должна проверять, изоморфны ли данные деревья
% (Два дерева называются изоморфными, если можно отобразить одно из них в другое, изменением порядка ветвей в поддеревьях).
clauses
    print_tree(nil) :-
        !.
    print_tree(tree(Root, Left, Right)) :-
        stdio::write(Root, "\n"),
        print_tree(Left),
        print_tree(Right).
    start() :-
        print_tree(tree('d', tree('b', tree('a', nil, nil), tree('c', nil, nil)), tree('e', nil, nil))).
    add_edges()


end implement

goal
    console::runUtf8(main::run).
