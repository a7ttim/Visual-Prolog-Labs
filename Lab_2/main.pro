% A7ttim

implement main
    open core

clauses
    run() :-
        contain::start(['a', 'b', 'c'], ['a', 'a', 'b', 'c', 'a', 'b', 'c', 'a', 'b', 'c']),
        succeed.  % place your own code here
% [a, [[b, []], [c, []]]]

end implement main

% A7ttim

class contain

predicates
    start : (char*, char*).
    divide : (char*, char*, integer [out]). % out - возвращаемое значение
    getLength : (char*, integer [out]).
    search_sublist : (char*, char*, integer [out]).

end class

implement contain

clauses
%//////////////////////////////////////////////////////////////////////////
% Точка входа
%//////////////////////////////////////////////////////////////////////////
    start([], []) :-
        stdio::write("Пустой список"),
        !.  % Нет списков - послать лесом и вывести предупреждение */
    start(L, P) :-
        divide(L, P, Z),
        stdio::write("Количество вхождений: ", Z),
        _ = console::readLine().
%//////////////////////////////////////////////////////////////////////////
% Рекурсивное сравнение
%//////////////////////////////////////////////////////////////////////////
    getLength([], 0).
    getLength([_ | L], N) :-
        getLength(L, N1),
        N = N1 + 1.

    search_sublist([], _, 1) :-
        !.  /* Нет подсписка - вернуть 1 */
    search_sublist(_, [], 0) :-
        !.  /* Нет списка- вернуть 0, значит подсписок длиннее */
    search_sublist([Sublist_head | Sublist_tail], [List_head | List_tail], Num) :-
        Sublist_head = List_head,
        !,
        search_sublist(Sublist_tail, List_tail, Num_1),
        Num = Num_1.
    search_sublist(_, _, 0) :-
        !.

    divide([], _, 0) :-
        !.
    divide(_, [], 0) :-
        !.
    divide([Sublist_head | Sublist_tail], [List_head | List_tail], Num) :-
        divide([Sublist_head | Sublist_tail], List_tail, Num_1),
        Sublist_head = List_head,
        !,
        search_sublist(Sublist_tail, List_tail, Num_2),
        Num = Num_1 + Num_2.
    divide([Sublist_head | Sublist_tail], [_ | List_tail], Num) :-
        divide([Sublist_head | Sublist_tail], List_tail, Num_1),
        Num = Num_1.
%Num = P + Num_1.
%//////////////////////////////////////////////////////////////////////////

end implement

goal
    %console::init(), /* Не удалять, инициализация консоли */
    /*List = console::readLine(),
    math::toInteger(List, List_Int),
    console::clearInput(), TODO: Ввод с консоли */

    console::runUtf8(main::run).

