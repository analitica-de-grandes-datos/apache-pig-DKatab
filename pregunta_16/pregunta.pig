/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT
       firstname,
       color
   FROM 
       u
   WHERE color = 'blue' OR firstname LIKE 'K%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/
table = LOAD './data.csv' USING PigStorage(',')
  AS (num:int, nombre:charArray, apellido:charArray, fecha:charArray, color:charArray, num2:int);
sub_table = FOREACH table GENERATE nombre, color;
filter_table = FILTER sub_table BY (nombre matches 'K.*') or (color matches 'blue');
STORE filter_table INTO 'output/'USING PigStorage(',');
