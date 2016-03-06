-- Obtener un resumen de la tabla y de todas sus columnas
DESCRIBE EMPRESA_MODULOS;

-- Insert: ejemplo con especificación de columna
INSERT INTO CLIENTE(COLUMNA1,COLUMNA3) VALUES(VALOR1,VLAOR2);

-- Select: recuperación de datos
SELECT COLUMNAS FROM TABLA WHERE CONDICION ORDER BY COLUMNAS_ORDENAMIENTO;

SELECT APELLIDO, CO, VENTAS FROM CLIENTE WHERE COD_PROV = 'CA' AND VENTAS>6000;
SELECT APELLIDO, CO, VENTAS FROM CLIENTE WHERE COD_PROV != 'MA';
SELECT APELLIDO, CO, VENTAS FROM CLIENTE WHERE VENTAS BETWEEN 1000 AND 5000;

-- Oracle dispone de un completo conjunto de operaciones para restringir las filas
-- que se recuperan

-- Like: busqueda de patrones.
SELECT * FROM ESTADOS WHERE DESCRIPCION LIKE '%EN%';
SELECT*FROM CLIENTE WHERE APELLIDO LIKE '%TIN%'

-- Order by(cuando no se especifica se utiliza el orden ascendente)
SELECT * FROM CLIENTE ORDER BY COD_PROV, APELLIDO;

-- Utilización de funciones con el tipo de datos number
-- abs : se obtiene el valor absoluto abs(-321) = 321
-- operaciones + * /
SELECT VENTAS_ANUALES + VENTAS_ACTUALES FROM VENTAS;

 -- CEIL(N): El siguiente entero mayor o igual que n ceil(n)
 SELECT CEIL(10,6) FROM DUAL -- 11

-- FLOOR(N): el mayor entero menor o igual que n
SELECT FLOOR(10,6) FROM DUAL -- 10

-- MOD(M,N): resto de m divido entre n. si n=0 devuelme m
SELECT MOD(7,5) FROM DUAL -- 2

-- POWER(M,N):  m elevado n
SELECT POWER(3,2) FROM DUAL -- 9

-- ROUND(N,M): resultado redondeado a m cifras a la derecha del punto decimal
SELECT ROUND(1234,5678,2) FROM DUAL -- 1234,57

-- SING(N): Si n=0, devuelve 0; si n>0 devuelve 1; si n<0 devuelve -1
SELECT SING(12) FROM DUAL -- 1

-- SQRT(M,N): Raiz cuadrada de n
SELECT SQRT(25) FROM DUAL -- 5


-- FUNCIONES HABITUALES para datos de tipo caracter

-- INITCAP(CHAR): convierte el primer caracter de la cadena en mayuscula
SELECT INITCAP('mr. Miguel') FROM DUAL -- Mr Miguel

-- LOWER(CHAR): convierte toda la cadena a minúscula
SELECT LOWER('MR MIGUEL') FROM DUAL -- mr miguel

-- REPLACE(CHAR, CAD1, CAD2): Sustituye CAD1 por CAD2 en la cadena de caracteres CHAR
SELECT REPLACE('Scott','S','Boy') -- Boycott

-- SOUNDEX(CHAR): representación fonética de CHAR suele utilizarse para realizar búsqueda aproximada de nombres
-- pueden compararse palabras que se escriban de forma distinta
SELECT APELLIDO FROM EMPLEADO WHERE SOUNDEX(APELLIDO) = SOUNDEX('SMYTHE') --SMITH

-- SUBSTR(CHAR,M,N): Toma n caracteres de la cadena CHAR empezando en la posicion m
SELECT SUBSTR('ABCDEFG',2,3) FROM DUAL; -- BCD

-- LENGTH(CHAR): longitud de CHAR
SELECT LENGTH('MIGUEL') FROM DUAL -- 6


-- TIPO DE DATO FECHA
-- DATE : contiene la fecha y la hora
-- el formato de fecha predeterminado de Oracle es DD-MM-AA donde AA son las dos últimas cifras del año

-- sysdate: fecha y hora del sistema
SELECT SYSDATE FROM DUAL;

-- last_day último día del mes
SELECT LAST_DAY(SYSDATE) FROM DUAL

--ADD_MONTHS(D,N) suma  o resta n meses a la fecha d
SELECT ADD_MONTHS(SYSDATE,2) FROM DUAL;

-- MONTHS_BETWEEN(F,S) diferencia en meses entre la fecha f y la fecha s
SELECT MONTHS_BETWEEN(SYSDATE,'25-MA-16') FROM DUAL;

-- NEXT_DAY(D,DIA) fecha que corresponde al día especificado de la semana posterior d
SELECT NEXT_DAY(SYSDATE,'MONDAY') FROM DUAL;

-- Aritmética de fechas
--  a las fecha se le sumaran días
SELECT FECHA_VENTA + 14 FROM VENTA;


-- CONVERSIÓN DE UN TIPO DE COLUMNA EN OTRO
-- TO_CHAR: convierte cualquier tipo de datos al tipo character
SELECT TO_CHAR(6354) FROM DUAL;

-- TO_NUMBER: convierte un conjunto válido de datos character numéricos
SELECT TO_NUMBER('6354') FROM DUAL;

-- TO_DATE: convierte datos de tipo character al formato adecuado del tipo de datos DATE
SELECT TO_DATE('12-DEC-16') FROM DUAL;
