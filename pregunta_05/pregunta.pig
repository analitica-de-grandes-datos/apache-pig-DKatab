/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
table = LOAD './data.tsv' USING PigStorage('\t')
        AS (f1:charArray, f2:BAG{t: TUPLE(p:charArray)}, f3:MAP[]);


r = FOREACH table GENERATE FLATTEN(f2) as keyword;
grouped = GROUP r BY keyword;
wordcount = FOREACH grouped GENERATE group, COUNT(r);

STORE wordcount INTO 'output' USING PigStorage(',');


