
-- Obtenemos los empleados con la misma posición que "Marquez":

SELECT APELLIDO
  FORM EMPLE
  WHERE POSICION = (SELECT POSICION 
      FROM EMPLE
      WHERE APELLIDO LIKE 'Marquez');
