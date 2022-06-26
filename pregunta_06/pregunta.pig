/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
table = LOAD './data.tsv' USING PigStorage('\t')
        AS (f1:charArray, f2:BAG{t: TUPLE(p:charArray)}, f3:MAP[]);


r = FOREACH table GENERATE FLATTEN(f3);
keyword = FOREACH r GENERATE $0 as word;
grouped = GROUP keyword BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(keyword);
STORE wordcount INTO 'output' USING PigStorage(',');
