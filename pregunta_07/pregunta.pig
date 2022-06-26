/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
table = LOAD './data.tsv' USING PigStorage('\t')
        AS (f1:charArray, f2:BAG{t: TUPLE(p:charArray)}, f3:MAP[]);

r = FOREACH table GENERATE f1, COUNT(f2) AS f2, SIZE(f3) AS f3;
o = ORDER r BY f1, f2, f3;

STORE o INTO 'output' USING PigStorage(',');
