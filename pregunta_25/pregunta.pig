/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT  
       firstname,
       SUBSTRING_INDEX(firstname, 'a', 1)
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD './data.csv' using PigStorage(',') AS (id:int, name:chararray, lastName:chararray, date:chararray, color:chararray, lvl:int);

result = FOREACH data GENERATE INDEXOF(name,'a');

STORE result INTO 'output' USING PigStorage(',');