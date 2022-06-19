/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD './data.tsv' USING PigStorage('\t') 
    AS (
            letra:chararray,
            fecha:chararray,
            num:int
    );

num_col = FOREACH lines GENERATE num;
num_set = ORDER num_col by num;
num_subset = LIMIT num_set 5;
STORE num_subset INTO 'output' USING PigStorage(',');