\set id :scale
\setrandom id 1 300000 

update jsontable set params = (select CAST(json_build_object('PARAM33', PARAM33,'PARAM46', PARAM46,'PARAM64', PARAM64,'PARAM79', PARAM79,'PARAM3', PARAM3,'PARAM6', PARAM6,'PARAM14', PARAM14,'PARAM17', PARAM17,'PARAM18', PARAM18,'PARAM19', PARAM19,'PARAM24', PARAM24,'PARAM8', PARAM8,'PARAM12', PARAM12,'PARAM22', PARAM22,'PARAM26', PARAM26,'PARAM4', PARAM4,'SUBOBJECT1',   json_build_object(  'PARAM45', PARAM45,  'PARAM34', PARAM34,   'PARAM29', PARAM29,  'PARAM32', PARAM32,  'PARAM35', PARAM35,  'PARAM2', PARAM2,  'PARAM7', PARAM7,  'PARAM10', PARAM10,   'PARAM59', PARAM59,  'PARAM74', PARAM74  ),'SUBOBJECT2',   json_build_object(  'PARAM9', PARAM9,  'PARAM1', PARAM1,  'PARAM15', PARAM15,  'PARAM23', PARAM23,  'PARAM28', PARAM28,  'PARAM36', PARAM36,  'PARAM5', PARAM5,  'PARAM11', PARAM11,  'PARAM20', PARAM20  ),'SUBOBJECT3',   json_build_object(  'PARAM25', PARAM25,  'PARAM16', PARAM16,  'PARAM43', PARAM43,  'PARAM50', PARAM50,  'PARAM51', PARAM51,  'PARAM13', PARAM13,  'PARAM21', PARAM21,  'PARAM27', PARAM27,  'PARAM30', PARAM30,  'PARAM44', PARAM44  )) as jsonb)from coltable where id = :id and type = 1) where id = :id and type = 1;