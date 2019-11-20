USE pubs;

-----6.1
--A
SELECT *
FROM authors;

--B
SELECT au_lname,au_fname,phone
FROM authors;

--C
SELECT au_fname,au_lname,phone
FROM authors
ORDER BY au_fname ASC, au_lname ASC;

--D
SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone
FROM authors
ORDER BY au_fname ASC, au_lname ASC;

--E
SELECT au_fname AS first_name, au_lname AS last_name, phone AS telephone
FROM authors
WHERE state = 'CA' AND NOT au_lname = 'Ringer'
ORDER BY au_fname ASC, au_lname ASC;

--F
SELECT *
FROM publishers
WHERE pub_name LIKE '%Bo%';

--G
SELECT DISTINCT pub_name
FROM publishers
INNER JOIN titles ON publishers.pub_id = titles.pub_id
WHERE titles.type = 'Business';

--H
SELECT pub_name, sum(qty) AS sum_qty
FROM publishers
INNER JOIN titles ON publishers.pub_id = titles.pub_id
INNER JOIN sales ON titles.title_id=sales.title_id
GROUP BY pub_name;

--I
SELECT pub_name, title, sum(qty) AS sum_qty
FROM publishers
INNER JOIN titles ON publishers.pub_id = titles.pub_id
INNER JOIN sales ON titles.title_id=sales.title_id
GROUP BY pub_name, title;

--J
SELECT title
FROM titles
INNER JOIN sales ON titles.title_id=sales.title_id
INNER JOIN stores ON sales.stor_id=stores.stor_id
WHERE stores.stor_name = 'Bookbeat';

--K
SELECT au_lname, au_fname
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY au_lname, au_fname
HAVING count(DISTINCT type) > 1;

--L
SELECT title, avg(price) AS Preço_Médio, count(qty) AS Número_Total_Vendas, type, publishers.pub_id
FROM titles
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
INNER JOIN sales ON titles.title_id=sales.title_id
GROUP BY title, type, publishers.pub_id;

--M
SELECT type, avg(advance) AS media_advance, max(advance/1.5) advance1_5, max(advance) AS max_advance
FROM titles
GROUP BY type
HAVING avg(advance) < max(advance/1.5);

--N
SELECT title, au_fname, au_lname, price*qty AS valor
FROM titles
INNER JOIN sales ON titles.title_id=sales.title_id
INNER JOIN titleauthor ON titleauthor.title_id = titles.title_id
INNER JOIN authors ON authors.au_id = titleauthor.au_id;

--Q
SELECT stor_name
FROM stores
INNER JOIN sales ON sales.stor_id=stores.stor_id
INNER JOIN titles ON titles.title_id=sales.title_id
GROUP BY  stor_name
HAVING count(qty)=count(stor_name);

--R
SELECT stor_name
FROM stores
INNER JOIN sales ON sales.stor_id=stores.stor_id
INNER JOIN titles ON titles.title_id=sales.title_id
GROUP BY stor_name
HAVING avg(qty) < sum(qty);