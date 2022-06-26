/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/
table = LOAD './data.csv' USING PigStorage(',')
  AS (num:int, nombre:charArray, apellido:charArray, fecha:charArray, color:charArray, num2:int);

sub_table = FOREACH table GENERATE color;
filter_table = FILTER sub_table BY ($0 matches '.*b.*');
STORE filter_table INTO 'output/';
