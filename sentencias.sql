-- Pl/SQL
-- Lenguaje de procesamiento procedimental y dispone de construcciones de programación similares
-- a  las de la mayoria de los lenguajes de programación. Existen dos versiones  de PL/SQL
-- una de ellas forma parte del motor de base de datos, la otra es un motor independiente que se encuentra
-- incorporado en varias herramientas de Oracle.

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
-- IN : igual a cualquiera de los miembros entre paréntesis
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


/*
 * COMPONENTES DE PL/SQL
 */

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

-- SECCION DECLARE EN PROCEDIMIENTOS ALMACENADOS
CREATE OR REPLACE PROCEDURE SP_SAMP(PARAM1 IN VARCHAR2, PARAM2 IN VARCHAR2)
IS
BEGIN
  DECLARE
    ACCUM1 NUMBER;
    ACUMM2 NUMBER;
    H_DATE DATE := SYSDATE; -- inicializamos variables
    TEM_BUFFER VARCHAR2,
    CURSOR MY_CURSOR IS
      SELECT * FROM PERSON WHERE LAST_NAME= PARM1 AND SAL_STAT = PARAM2;
  BEGIN
    ...
    ...
  END;
END;

DECLARE

-- El procedimiento debe ser declarado dentro de la sección DECLARE .. BEGIN
PROCEDURE REGISTRAR_CLIENTE(
  P_ID NUMBER,
  P_NOMBRES VARCHAR2,
  P_APELLIDOS VARCHAR2,
  P_FECHA DATE)
IS
BEGIN
  INSERT INTO hr.cliente(id,nombres,apellidos,fecha_afiliacion)
       VALUES (P_ID,P_NOMBRES,P_APELLIDOS, P_FECHA);
  DBMS_OUTPUT.PUT_LINE('Insertado cliente: '|| P_ID || ' ' || P_NOMBRES || ' ' || P_APELLIDOS);
END;

BEGIN
  -- Eliminamos los registros anteriores de la tabla CLIENTE para evitar conflictos con sus ID.
  DELETE FROM hr.cliente;

  -- Para utilizar el procedimiento creado debemos invocarlo por su nombre,
  -- adicionalmente, debemos especificar los valores para los parámetros de la función
  REGISTRAR_CLIENTE(1,'Juan', 'Rosales', SYSDATE);
  REGISTRAR_CLIENTE(2,'Luis', 'Cabrera', SYSDATE);
  REGISTRAR_CLIENTE(3,'Pedro', 'Morales', TO_DATE('13/09/80','DD/MM/YYYY'));
END;

-- Agregando la palabra reservada CREATE,
-- podemos almacenar el procedimiento en la base de datos
-- para poderla reutilizar desde cualquier bloque anónimo
-- o procedimiento
CREATE PROCEDURE HR.REGISTRAR_CLIENTE(P_ID        NUMBER,
                                      P_NOMBRES   VARCHAR2,
                                      P_APELLIDOS VARCHAR2,
                                      P_FECHA     DATE)
IS
BEGIN
  INSERT INTO hr.cliente(id,nombres,apellidos,fecha_afiliacion)
     VALUES (P_ID,P_NOMBRES,P_APELLIDOS, P_FECHA);
  DBMS_OUTPUT.PUT_LINE('Insertado cliente: '|| P_ID || ' ' || P_NOMBRES || ' ' || P_APELLIDOS);
END;


CREATE OR REPLACE
PROCEDURE Actualiza_Saldo(cuenta NUMBER,
                          new_saldo NUMBER DEFAULT 10 )
IS
  -- Declaracion de variables locales
BEGIN
  -- Sentencias
  UPDATE SALDOS_CUENTAS
	SET SALDO = new_saldo,
            FX_ACTUALIZACION = SYSDATE
  WHERE CO_CUENTA = cuenta;

END Actualiza_Saldo; 
