/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
table = LOAD './data.tsv' USING PigStorage('\t')
        AS (f1:charArray, f2:BAG{t: TUPLE(p:charArray)}, f3:[]);

col = FOREACH table GENERATE FLATTEN(f2) AS letra, FLATTEN(KEYSET(f3)) AS tres;
grouped = GROUP col by (letra,tres);
final = FOREACH grouped GENERATE group, COUNT(col);
STORE final INTO 'output' USING PigStorage(',');
