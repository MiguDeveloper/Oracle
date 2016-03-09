-- Simbolos
-- := asignación
-- /* */ delimitador de comentario
-- || concatenador


-- Obtener un resumen de la tabla y de todas sus columnas
DESCRIBE EMPRESA_MODULOS;

-- Insert: ejemplo con especificación de columna
INSERT INTO CLIENTE(COLUMNA1,COLUMNA3) VALUES(VALOR1,VLAOR2);

-- Select: recuperación de datos
SELECT COLUMNAS FROM TABLA WHERE CONDICION ORDER BY COLUMNAS_ORDENAMIENTO;

SELECT APELLIDO, CO, VENTAS FROM CLIENTE WHERE COD_PROV = 'CA' AND VENTAS>6000;
SELECT APELLIDO, CO, VENTAS FROM CLIENTE WHERE COD_PROV != 'MA';
SELECT APELLIDO, CO, VENTAS FROM CLIENTE WHERE VENTAS BETWEEN 1000 AND 5000;

-- Update: actualizar campos
UPDATE TABLA SET CAMPOS WHERE CONDICION;
UPDATE CLIENTE SET VENTAS=2000 WHERE COD_CLIENTE=34;

-- Delete: eliminar una o varias filas
DELETE FROM TABLA WHERE CONDICION;
DELETE FROM CLIENTE WHERE COD_CLIENTE=1;

-- Alter: modificar la tabla
ALTER TABLE CLIENTE ADD(FECHA_VENTA DATE);
-- ahora modificaremos el tipo de dato de una tabla
ALTER TABLE NOMBRE_TABLA MODIFY(NOMBRE_CAMPO NUEVA_DEFINICION);
ALTER TABLE LIBROS MODIFY(PRECIO NUMBER(6,2) NOT NULL);

-- Oracle dispone de un completo conjunto de operaciones para restringir las filas
-- que se recuperan

-- Like: busqueda de patrones.
SELECT * FROM ESTADOS WHERE DESCRIPCION LIKE '%EN%';
SELECT*FROM CLIENTE WHERE APELLIDO LIKE '%TIN%'

-- Order by(cuando no se especifica se utiliza el orden ascendente)
SELECT * FROM CLIENTE ORDER BY COD_PROV, APELLIDO;

-- Operación de comparación habituales
-- IN : igual a cualquiera de los miembros entre paréntesis. In= permite saber si una expresión pertenece o no a un conjunto de valores.
SELECT * FROM EMPLEADO WHERE COD_PROV IN('CD','WD')

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
SELECT ROUND(1234.5678,2) FROM DUAL; -- 1234.57
TRUNC (NUMERO,M);

-- SING(N): Si n=0, devuelve 0; si n>0 devuelve 1; si n<0 devuelve -1 no indica el signo de la variable
SELECT SING(12) FROM DUAL -- 1

-- SQRT(M,N): Raiz cuadrada de n
SELECT SQRT(25) FROM DUAL -- 5

-- Calcula el máximo
MAX(EXPRESION);

--Calcula el minimo
MIN(EXPRESION);

-- Obtiene la suma de los valores de la expreión
SUM(EXPRESION);

-- Obtiene el mayor valor de la lista
GREATEST(VALOR1,VALOR2);

-- Obtiene el menor valor de la lista
LEAST(VALOR1,VALOR2);

-- Devuelve "cad1" concatenada con "cad2".
CONCAT (cad1, cad2);

-- Devuelve la cadena "cad" en mayúsculas
LOWER (cad);

-- Devuelve la cadena "cad" en minúsculas.
UPPER (cad)=

-- Suprime un conjunto de caracteres a la izquierda de la cadena.
LTRIM (cad [,set]);

-- Suprime un conjunto de caracteres a la derecha de la cadena.
RTRIM (cad [,set]);

-- Sustituye un carácter o caracteres de una cadena con 0 o mas caracteres.
REPLACE (cad, cadena_busqueda [, cadena_sustitucion]);

-- Obtiene parte de una cadena.
SUBSTR (cad, m [,n]);


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


/*
 * COMPONENTES DE PL/SQL
 */

/* Uso de los atributos %TYPE y %ROWTYPE
    %TYPE: declara una variable del mismo tipo que otra, o que una columna de una tabla
    %ROWTYPE : crea una variable registro cuyos campos se corresponden con las columnas de una tabla o vista.
*/

DECLARE
  v_employee_id NUMBER(6);
  v_hire_date DATE;
  v_last_name VARCHAR2(25);
BEGIN
  SELECT employee_id, last_name, hire_date
    INTO v_employee_id, v_last_name, v_hire_date
    FROM employees
    WHERE rownum = 1;
END;

DECLARE
  v_employee_id employees.employee_id%TYPE;
  v_hire_date employees.hire_date%TYPE;
  v_last_name employees.last_name%TYPE;
BEGIN
  SELECT employee_id, last_name, hire_date
    INTO v_employee_id, v_last_name, v_hire_date
    FROM employees
    WHERE rownum = 1;
END;



DECLARE
  v_employees employees%ROWTYPE;
BEGIN
  SELECT *
    INTO v_employees
    FROM employees
    WHERE rownum = 1;
END;

-- Esta recoge la totalidad de las columnas y los ponga a disposición en su programa. 
-- Puede detallar cada una de las columnas en su lista de selección como este:

DECLARE
  v_employees employees%ROWTYPE;
BEGIN
  SELECT employee_id, first_name, last_name,
         email, phone_number, hire_date, job_id, salary,
         commission_pct, manager_id, department_id
    INTO v_employees
    FROM employees
    WHERE rownum = 1;
END;



-- ESTRUCTURA LOGICA IF

IF VAR1>1O THEN
  VAR2 := VAR1 + 20;
ELSEIF VAR1 BETWEEN 7 AND 8 THEN
  VAR2 := 2 * VAR1;
ELSE
  VAR2 := VAR1 * VAR1;
END IF;


-- BUCLES
CNT := 1; --inicializamos el contador

LOOP  -- comienzo del bucle
  CNT := CNT + 1;
  IF CNT >100
    EXIT;
  END IF;
  ...
  ...
END LOOP -- finalizar el bucle


CNT := 1; --inicializamos el contador
LOOP  -- comienzo del bucle
  CNT := CNT + 1;
  EXIT WHEN CNT > 100;
  ...
  ...
END LOOP -- finalizar el bucle

-- bucle while
CNT := 1;
WHILE CNT <= 100 LOOP
  ...
  CNT := CNT +1;
  ...
END LOOP;

-- Bucle for
FOR I IN 1..3 LOOP
  INSERT INTO TABLA1 VALUES('VUELTA',CNT);
END LOOP;


-- CONSTRUCCION NULL(NO HACER NADA)
IF ANT>=90 THEN
  NULL;
ELSE
  INSERT INTO TBA1 VALUES(CNT, 'SIGUE SIENDO MENOR QUE 90');
END IF;
