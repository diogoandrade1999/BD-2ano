use pubs;
GO
--A
--1
CREATE VIEW title_author AS
SELECT titles.title, authors.au_fname, authors.au_lname
FROM titles JOIN titleauthor ON titles.title_id=titleauthor.title_id JOIN authors ON titleauthor.au_id=authors.au_id;

--2
CREATE VIEW publisher_employee AS
SELECT pub_name, fname, lname
FROM employee JOIN publishers ON employee.pub_id=publishers.pub_id;

--3
CREATE VIEW stores_titles AS
SELECT stor_name, title
FROM stores JOIN sales ON stores.stor_id=sales.stor_id JOIN titles ON sales.title_id=titles.title_id;

--4
CREATE VIEW business_titles AS
SELECT title_id, title, type, pub_id, price, notes
FROM titles
WHERE titles.[type]='Business'
WITH CHECK OPTION;

--B
SELECT title_author.title, au_fname, au_lname, stor_name
FROM title_author JOIN stores_titles ON title_author.title=stores_titles.title
JOIN business_titles ON business_titles.title=stores_titles.title;

-- C
ALTER VIEW title_author AS
SELECT titles.title_id, titles.title, authors.au_fname, authors.au_lname
FROM titles JOIN titleauthor ON titles.title_id=titleauthor.title_id JOIN authors ON titleauthor.au_id=authors.au_id;

ALTER VIEW stores_titles AS
SELECT stor_name, titles.title_id
FROM stores JOIN sales ON stores.stor_id=sales.stor_id JOIN titles ON sales.title_id=titles.title_id;

SELECT stor_name, au_fname, au_lname
FROM title_author JOIN stores_titles ON title_author.title_id=stores_titles.title_id
ORDER BY stor_name;

--D
--1
-- Sim, teve sucesso e nao faz sentido

--2
ALTER VIEW business_titles AS
SELECT title_id, title, type, pub_id, price, notes
FROM titles
WHERE titles.[type]='Business'
WITH CHECK OPTION;

--3
insert into business_titles (title_id, title, type, pub_id, price, notes)
values('BDTst2', 'New BD Book2','popular_comp2', '13892', $31.00, 'A must-read for
DB course2.')