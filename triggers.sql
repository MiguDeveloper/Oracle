/*
 * TRIGGERS

Un "trigger" (disparador o desencadenador) es un bloque de código que se ejecuta automáticamente cuando ocurre algún
evento (como inserción, actualización o borrado) sobre una determinada tabla (o vista); es decir,
cuando se intenta modificar los datos de una tabla (o vista) asociada al disparador.

La diferencia con los procedimientos almacenados del sistema es que los triggers:

  - no pueden ser invocados directamente; al intentar modificar los datos de una tabla asociada a un disparador, el disparador se ejecuta automáticamente.
  - no reciben y retornan parámetros.
  - son apropiados para mantener la integridad de los datos, no para obtener resultados de consultas.

Los disparadores pueden clasificarse según tres parámetros:

  - el momento en que se dispara: si se ejecutan antes (before) o después (after) de la sentencia.
  - el evento que los dispara: insert, update o delete, según se ejecute una de estas sentencias sobre la tabla.
  - nivel: dependiendo si se ejecuta para cada fila afectada en la sentencia (por cada fila) o bien una única vez
    por sentencia independientemente de la filas afectadas (nivel de sentencia).

Elementos de un trigger

before / after: elemento que dispara el trigger
nombre: nombre del trigger que tiene que ser único.
for each: nivel del disparo del trigger que por defecto es statement que significa que se dispara una
sola vez por cada operación independientemente del número de filas afectadas.
for each row: salta por cada fila afectada.
Variables posibles para update: la primera es :old que hace referencia a los valores anteriores
y :new que hace referencia a los nuevos valores de actualización de la fila.
Tenemos que tener en cuanta unos cuantos aspectos:

  - Cuando el evento que dispara el trigger es un delete haremos referencia al valor :old porque el valor :new es nulo
  - Cuando el evento que dispara el trigger es un insert haremos referencia al valor :new porque el :old es nulo.
  - Cuando el evento es un update tiene sentido hacer referencia a los dos valores.
  - Sólo se pueden utilizar cuando el trigger es a nivel de fila (for each row).

Vamos a a crear un trigger que se disparé automáticamente después de la modificación del salario de la tabla empleado
y pase un comentario a la tabla auditar.
*/

create or replace trigger NOMBREDISPARADOR
   MOMENTO -- before, after o instead of
   EVENTO -- insert, update o delete
   of CAMPOS -- solo para update
   on NOMBRETABLA
   NIVEL--puede ser a nivel de sentencia (statement) o de fila (for each row)
   when CONDICION--opcional
 begin
  CUERPO DEL DISPARADOR--sentencias
 end NOMBREDISPARADOR;


Create or replace trigger auditar_salario
  after
  update
    of salario
  on empleado
  for each row
  begin
    insert into auditar values
         ('se ha modificado el salario' || :old.num_empleado);
  end;
