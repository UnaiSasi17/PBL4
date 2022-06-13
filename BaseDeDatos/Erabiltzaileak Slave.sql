#Esklabuarentzat, erabiltzaile berdina sortu.
CREATE USER 'Tidyfood'@'%' IDENTIFIED BY 'a';
GRANT ALL ON *.* TO 'Tidyfood'@'%' WITH GRANT OPTION;
#zerbitzua gelditu, agian martxan egon liteke eta erroreak eman
stop slave;

#Datuak ezarri
CHANGE MASTER TO MASTER_HOST='172.17.100.70',
MASTER_USER='Tidyfood',
MASTER_PASSWORD='a',
MASTER_LOG_FILE='CENTRAL-bin.000006',#depende
MASTER_LOG_POS= 771;#depende

#datuak jarritakoan, martxan jarri
start slave;

#Heidi, Datagrip, Workbench-en ikusteko erreplikazioaren estadoa:
show slave status;

#Kontxolan horrela ikusi daiteke, baina pixkat galdu egin gaitezke, horretarako:
show slave status \G #Punto komarik gabe