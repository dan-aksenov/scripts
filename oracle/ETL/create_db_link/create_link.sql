conn repadmin/rep095@&3.
spo .\log\&3..log
CREATE DATABASE LINK &2.
 CONNECT TO REPADMIN
 IDENTIFIED BY rep095
 USING '(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=&1.)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SID=ORCL)))';
spo off
exit