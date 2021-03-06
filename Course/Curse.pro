/*****************************************************************************

		Copyright (c) My Company

 Project:  CURSE
 FileName: CURSE.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "curse.inc"
	
domains

	genres_numbers = integer*.
	genres_names = string*.
	movies_names = string*.
	actors = integer*.

predicates
	% �������, �� ��������
	append(genres_numbers,genres_numbers,genres_numbers).
	write_n(movies_names).		
	write_n_rec(movies_names).		
	
	% ��������� ��		
	start().
	start_action(integer).
	
	movie(string, integer, integer, integer, actors, real).
	
  	name(integer, string).
 	genre(integer, string).
  	for_by_genre(genres_names, genres_numbers).
  	get_movies_by_genres_names(string, movies_names).
  	
  	get_movies_by_author(string, movies_names).
  	
  	get_movies_by_rating(movies_names).  	

  	%mycourse().

clauses

	% �������
	append([],List,List).
	append([H|L1],List2,[H|L3]):-
	append(L1,List2,L3).
		
	% �����
	genre(1, "�����").
	genre(2, "��������������").
	genre(3, "������").
	genre(4, "�������"). 
	genre(5, "�������"). 
	genre(6, "��������"). 
	genre(7, "�������"). 
	genre(8, "��������������"). 
	genre(9, "�����"). 
	genre(10, "������������"). 
	genre(11, "����������"). 
	genre(12, "�������"). 
	genre(13, "�������"). 
	genre(14, "����������������"). 
	genre(15, "��������"). 
	genre(16, "���������"). 
	genre(17, "�������"). 
	genre(18, "������"). 
	genre(19, "����������"). 
	genre(20, "������"). 
	genre(21, "�������"). 
	genre(22, "�����������"). 
	genre(23, "�������-���"). 
	genre(24, "��������"). 
	genre(25, "�����"). 
	genre(26, "���-���"). 
	genre(27, "�������"). 
	genre(28, "�����"). 
	genre(29, "����������"). 
	genre(30, "�����-����"). 
	genre(31, "�������"). 
	genre(32, "�������").
  	
  	% ������  	
	include "names.inc"
	
  	% ������   
	include "movies.inc"
   	
   	clauses
   	% �� ������
   	for_by_genre([], []).
	for_by_genre([Genre | Genres], Result) :-
    		findall(X, genre(X, Genre), Genres_numbers),
    		for_by_genre(Genres, GetResult),
    		append(Genres_numbers, GetResult, Result).
        
        get_movies_by_genres_names(Genres_name, Result):-
    		%for_by_genre(Genres_names, Genres_numbers),
    		genre(Genres_number,Genres_name),
    		findall(X, movie(X,_,_,Genres_number,_,_), Result), Result = [], write("�� �������\n").	
    	get_movies_by_genres_names(Genres_name, Result):-
    		%for_by_genre(Genres_names, Genres_numbers),
    		genre(Genres_number,Genres_name),
    		findall(X, movie(X,_,_,Genres_number,_,_), Result).
    		
    	%get_movies_by_genres_names(_, ["��� ������ �����"]):-!.

    	% �� ��������    	
    	get_movies_by_author(Author_name, Result):-
    		name(X, Author_name),
    		findall(Y, movie(Y,X,_,_,_,_), Result), Result = [], write("�� �������\n").	
    	get_movies_by_author(Author_name, Result):-
    		name(X, Author_name),
    		findall(Y, movie(Y,X,_,_,_,_), Result).	
    		
    	% �� ��������
    	get_movies_by_rating(Result):-
    		findall(X, movie(X,_,_,_,_,_), Result).
    		
    	% ���������� �����    	
    	write_n([]):-!.
    	write_n(List):-
    		write("================================\n"),
    		write_n_rec(List),
    		write("================================\n").
    		    		
    	write_n_rec([]). 	
    	write_n_rec([Head | Tail]):-
    		write(Head, "\n"),
    		write_n_rec(Tail).
    	
    	% ���������� ����   	
    	start_action(1):-
		readln(Author),
		get_movies_by_author(Author, Movies_by_author),
		write_n(Movies_by_author), !,
		start().		
    	start_action(1):-    		
		write("�� �������\n"), !,
		start(), !.
	
	start_action(2):-    
    		readln(Genre_name),		
  		get_movies_by_genres_names(Genre_name, Movies_by_genres),
  		write_n(Movies_by_genres), !,
		start().
  	start_action(2):-    		
		write("�� �������\n"), !,
		start().	
    	start():-
		write("����:\n1 - ����� ������� �� ��������\n2 - ����� ������� �� �����\n"),
		readint(Action),		
		start_action(Action), !.
    	
goal
	start(),
  	readchar(_).	