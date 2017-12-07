% A7ttim

class sign

predicates
    start : (integer*).
    divide : (integer*, boolean [out]). % out - возвращаемое значение

end class

implement sign

clauses
%//////////////////////////////////////////////////////////////////////////
% Точка входа
%//////////////////////////////////////////////////////////////////////////
    start([]) :-
        stdio::write("Пустой список"),
        !.  % Нет списка - послать лесом и вывести предупреждение */
    start(L) :-
        divide(L, I),
        if I = true then
            % Один знак равно, а не два. TODO: Выяснить, почему */
            stdio::write("Все числа положительные")
        else
            stdio::write("Есть отрицательное число")
        end if,
        _ = console::readLine().
%//////////////////////////////////////////////////////////////////////////
% Рекурсивное сравнение
%//////////////////////////////////////////////////////////////////////////
    divide([], true) :-
        !.  /* Нет списка - послать лесом и вернуть true */
    divide([H | T], Z) :-
        if H >= 0 then
            divide(T, Z)
        else
            Z = false
        end if.
%//////////////////////////////////////////////////////////////////////////

end implement

goal
    console::init(), /* Не удалять, инициализация консоли */
    /*List = console::readLine(),
    math::toInteger(List, List_Int),
    console::clearInput(), TODO: Ввод с консоли */
    List = [1, -7, 2, 5],
    sign::start(List).
