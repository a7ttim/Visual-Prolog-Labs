% A7ttim

implement main
    open core

clauses
    run() :-
        contain::start(['a', 'b', 'c'], ['d', 'a', 'b', 'c', 'a', 'b', 'd']),
        succeed.  % place your own code here

end implement main

% A7ttim

class contain

predicates
    start : (char*, char*).
    divide : (char*, char*, integer [out]). % out - возвращаемое значение
    getLength : (char*, integer [out]).

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
        /*
    * Шаг 1: Определяем кол-во символов в подстроке
    * Шаг 2: Сравние N символов
    * Шаг 3: Откидываем голову, скидываем хвост в эту же функцию и повторяем с шага 1
    * Шаг 4. Возвращаем кол-во вхождений
    *
    */
    getLength([], 0).
    getLength([_ | L], N) :-
        getLength(L, N1),
        N = N1 + 1.

    divide(_, [], 0) :-
        !.  /* Нет списков - послать лесом и вернуть 0 */
    divide(List, [_ | Tail], Num) :-
        getLength(List, Count),
        getLength(Tail, Count_2),
        if Count_2 >= Count then
            %sublis(Big_list, Count, Ret),
            string::subString(0),
            divide(List, Tail, Num_1),
            if Tail = List then
                Num = Num_1 + 1
            else
                Num = Num_1
            end if
        else
            Num = 0
        end if.
%Num = P + Num_1.
%//////////////////////////////////////////////////////////////////////////

end implement

goal
    %console::init(), /* Не удалять, инициализация консоли */
    /*List = console::readLine(),
    math::toInteger(List, List_Int),
    console::clearInput(), TODO: Ввод с консоли */

    console::runUtf8(main::run).

