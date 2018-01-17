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
        nil.

predicates
    print_tree : (tree) nondeterm.
    search_tree : (tree, tree) nondeterm.
    %add_edges : (treetype, edge).
    start : () nondeterm.

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
    search_tree(nil, nil).
    search_tree(tree(Froot, Fl, Fr), tree(Froot, Sl, Sr)) :-
        search_tree(Fl, Sl),
        search_tree(Fr, Sr).
    search_tree(tree(Froot, Fl, Fr), tree(Froot, Sl, Sr)) :-
        search_tree(Fl, Sr),
        search_tree(Fr, Sl).
    start() :-
        %print_tree(tree('a', tree('b', nil, nil), tree('c', nil, nil))),
        %print_tree(tree('c', tree('a', tree('b', nil, nil), nil), nil)).
        search_tree(tree('a', tree('b', nil, nil), tree('c', nil, nil)), tree('c', tree('a', tree('b', nil, nil), nil), nil)).

end implement

goal
    console::runUtf8(main::run).
