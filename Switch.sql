use AdventureWorks2019
-- CASE se puede utilizar en cualquier instrucción o
-- cláusula que permite una expresión válida.
-- Por ejemplo, puede utilizar CASE en instrucciones como
---SELECT, UPDATE, DELETE y SET,
--  y en cláusulas como <select_list>, IN, WHERE, ORDER BY y HAVING.


-- Sintaxis

-- Simple CASE expression:
-- CASE input_expression
--      WHEN when_expression THEN result_expression [ ...n ]
--      [ ELSE else_result_expression ]
-- END

-- -- Searched CASE expression:
-- CASE
--      WHEN Boolean_expression THEN result_expression [ ...n ]
--      [ ELSE else_result_expression ]
-- END


-- A. Uso de una instrucción SELECT con una expresión CASE sencilla

-- En una instrucción SELECT, una expresión CASE sencilla solo permite una
-- comprobación de igualdad; no se pueden hacer otras comparaciones.
-- En este ejemplo se utiliza la expresión CASE para cambiar la presentación de categorías
-- de línea de productos con el fin de hacerla más comprensible.
 select ProductNumber,[Name] ,ProductLine ,
 CASE ProductLine
 WHEN 'R' THEN'Road'
 WHEN'M'Then 'Mountain'
 WHEN 'T'then'Touring'
 WHEN 'S'then 'Other sales items'
 ELSE 'not for sale'
 END as [category]
  from Production.Product
  WHERE ProductLine IN ('r','m');
