#Erabiltzaileak Sortu
CREATE USER IF NOT EXISTS 'Admin01'@'%' IDENTIFIED BY 'a';
CREATE USER IF NOT EXISTS 'erabiltzaile'@'%' IDENTIFIED BY 'a';
#Erabiltzaileei baimenak eman
GRANT ALL ON *.* to 'Admin01'@'%' WITH GRANT OPTION;
GRANT SELECT, UPDATE, INSERT, DELETE ON MUCoach.* to 'erabiltzaile'@'%';

#Replikaziorako erabiltzailea sortu
CREATE USER IF NOT EXISTS 'Tidyfood'@'%' IDENTIFIED BY 'a';
ALTER USER 'Tidyfood'@'%' IDENTIFIED WITH mysql_native_password BY 'a';
#Baimenak eman eta eguneratu
GRANT REPLICATION SLAVE ON *.* TO 'Tidyfood'@'%';
GRANT REPLICATION_SLAVE_ADMIN ON *.* TO 'Tidyfood'@'%';
GRANT REPLICATION CLIENT ON *.* TO 'Tidyfood'@'%';
FLUSH PRIVILEGES;

#Show master status sakatu:
show master status;
#eta hortik, File (CENTRAL-bin.XXXXXX) eta Posizioa, hartu