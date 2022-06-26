/*
Pregunta
===========================================================================

El archivo `data.csv` tiene la siguiente estructura:

  driverId       INT
  truckId        INT
  eventTime      STRING
  eventType      STRING
  longitude      DOUBLE
  latitude       DOUBLE
  eventKey       STRING
  correlationId  STRING
  driverName     STRING
  routeId        BIGINT
  routeName      STRING
  eventDate      STRING

Escriba un script en Pig que carge los datos y obtenga los primeros 10 
registros del archivo para las primeras tres columnas, y luego, ordenados 
por driverId, truckId, y eventTime. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

         >>> Escriba su respuesta a partir de este punto <<<
*/
data_drivers = LOAD './data.csv' USING PigStorage(',') 
    AS (
            driverId:int,
            truckId:int,
            eventTime:charArray,
            eventType:charArray,
            longitude:double,
            latitude:double,
            eventKey:chArarray,
            correlationId:charArray,
            driverName:charArray,
            routeId:long,
            routeName:charArray,
            eventDate:charArray
    );

sub_data = FOREACH data_drivers GENERATE driverId, truckId, eventTime;

sub_data_limit = LIMIT sub_data 10;
sub_data_limit_order = ORDER sub_data_limit BY driverId, truckId, eventTime;

STORE sub_data_limit_order INTO 'output' USING PigStorage(',');
