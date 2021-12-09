```
# cd /etc/yum.repos.d/
wget http://yum.oracle.com/public-yum-ol6.repo

wget http://public-yum.oracle.com/RPM-GPG-KEY-oracle-ol7 -O /etc/pki/rpm-gpg/RPM-GPG-KEY-oracle

sudo yum install oracle-database-preinstall-18c

wget https://download.oracle.com/otn-pub/otn_software/db-express/oracle-database-xe-18c-1.0-1.x86_64.rpm

https://docs.oracle.com/en/database/oracle/oracle-database/18/xeinl/installation-guide.html

sudo yum localinstall oracle-database-xe-18c-1.0-1.x86_64.rpm 
/etc/init.d/oracle-xe-18c configure

—
$ export ORACLE_SID=XE
$ export ORAENV_ASK=NO
$ . /opt/oracle/product/18c/dbhomeXE/bin/oraenv

ORACLE_HOME = [] ?  /opt/oracle/product/18c/dbhomeXE
The Oracle base has been set to /opt/oracle
—

lsnrctl status

Shutting Down and Starting Up Using the Configuration Services Script
# systemctl start oracle-se-18c
# systemctl stop oracle-xe-18c
# systemctl restart oracle-xe-18c


Shutting Down and Starting Up Using SQL*Plus
$ sqlplus / as sysdba
sqlplus '/ as sysdba'

SQL> SHUTDOWN IMMEDIATE

SQL> STARTUP
SQL> ALTER PLUGGABLE DATABASE ALL OPEN;


Automating Shutdown and Startup
# systemctl daemon-reload
# systemctl enable oracle-xe-18c


// for create user  | https://stackoverflow.com/a/41490385/8122500
alter session set "_ORACLE_SCRIPT"=true;

CREATE USER baital IDENTIFIED BY Imt1999 DEFAULT TABLE-SPACE example QUOTA 10M ON example TEMPORARY TABLESPACE temp QUOTA 5M ON system PROFILE app_user PASSWORD EXPIRE;

CREATE USER baital IDENTIFIED BY baital123 PASSWORD EXPIRE;
CREATE USER oracle IDENTIFIED BY oracle123 PASSWORD EXPIRE;

alter session set "_ORACLE_SCRIPT"=true;

GRANT CREATE SESSION TO baital;
grant sysdba to baital;
grant sysdba to oracle;
GRANT sysdba to oracle;
GRANT ALL PRIVILEGES TO super;

sqlplus oracle/ @yourIPserver:1521/orcl

#sequel_pro_oracle
listener
----
server name: yourIPserver
login: oracle
password: oracle123
SID: XE

ssh tunneling
----
server host: yourIPserver
Login : oracle
password: baital123
remote port: 22

optional for private key
----
ssh-keygen -t rsa -b 4096
ssh-copy-id oracle@yourIPserver
```