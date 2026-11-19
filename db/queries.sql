SELECT u.id, u.name, r.role AS role
FROM user_import u
JOIN role r ON r.id = u.role
WHERE u.login = '94d5ous@gmail.com' AND u.password = 'uzWC67';


SELECT t.id, t.articul, t.name_tovar, t.edinitsa, t.price, t.skidka, t.na_sklade,
t.opisanie, t.photo,
c.category AS category, p.proizvoditel AS proizvoditel, s.name_postavshika AS postavshi
FROM Tovar t
JOIN category_tovar c ON c.id = t.category_tovar
JOIN proizvoditel p ON p.id = t.proizvoditel
JOIN postavshi s ON s.id = t.postavshi
WHERE t.name_tovar = 1 AND s.name_postavshika like '%Kari%'
ORDER BY t.skidka DESC;


-- справочники для выпадающих списков в форме
SELECT id, category FROM category_tovar;
SELECT id, proizvoditel FROM proizvoditel;
SELECT id, name_postavshika FROM postavshi;
-- добавление товара
INSERT INTO Tovar
(articul, name_tovar, edinitsa, price, skidka, na_sklade, opisanie, photo, category_tovar,
proizvoditel, postavshi)
VALUES ('H782T5',2,'шт.',5000,5,8,'мужские Ботинки демисезонные kari','3.png',2,1,1);
-- открыть товар для редактирования — заполнить все поля сразу
SELECT * FROM Tovar WHERE id = 3;
-- сохранить изменения
UPDATE Tovar
SET articul = 'F635R4', name_tovar = 1, edinitsa = 'шт.', price = 4499, skidka = 4, na_sklade = 4, opisanie = '', photo = '', category_tovar = 2,
proizvoditel = 1, postavshi = 1
WHERE id = 3;