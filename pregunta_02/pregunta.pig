/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
lines = LOAD './data.tsv' USING PigStorage('\t') 
    AS (
            letra:chararray,
            fecha:chararray,
            num:int
    );



numeros = FOREACH lines GENERATE FLATTEN(TOKENIZE(num)) AS numeros;
order_by_data = ORDER numeros BY num LIMIT 5;
STORE order_by_data INTO 'output' USING PigStorage(',');
