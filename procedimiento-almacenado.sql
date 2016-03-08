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
