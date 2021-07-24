#!/bin/bash

# QUESTO SCRIPT SALVA LA CONFIGURAZIONE IN RUNNING DELLO SWITCH (running-config) SOVRASCRIVENDO IL FILE DI STARTUP (startup-config) E LO ARCHIVIA TRAMITE CONNESSIONE scp NEL PERCORSO IMPOSTATO
# SCRIPT PRECONFIGURATO PER CONNESSIONE ssh ALLO SWITCH csw001 CON UTENTE user_1

# PER ESEGUIRE LO SCRIPT BISOGNA ABILITARE LA CONFIGURAZIONE (config)file prompt quiet SULLO SWITCH
# PER ESEGUIRE LO SCRIPT BISOGNA INSTALLARE IL PACCHETTO sshpass



# IMPOSTARE UN IP O UN HOSTNAME DEL NODO SUL QUALE CI SI VUOLE COLLEGARE IN ssh
REMOTE_HOSTNAME=csw001

# IMPOSTARE UN UTENTE REMOTO CON PREABILITAZIONI ALLA CONNESSIONE ssh
REMOTE_USERNAME=user

# IMPOSTARE LA PASSWORD DI AUTENTICAZIONE ALLO SWITCH
REMOTE_PASSWORD=password

# IMPOSTARE UN PERCORSO NEL QUALE SALVARE I BACKUP
BACKUP_DIRECTORY=/home/user/backup/csw001



# ESEGUE LA CONNESSIONE ssh LANCIANDO IL COMANDO DI SALVATAGGIO DELLA running-config
sshpass -p $REMOTE_PASSWORD ssh $REMOTE_USERNAME@$REMOTE_HOSTNAME "copy running-config startup-config"

# ESEGUE LA COPIA DEL FILE startup-config SULLA DIRECTOTY LOCALE TRAMITE scp
sshpass -p $REMOTE_PASSWORD scp $REMOTE_USERNAME@$REMOTE_HOSTNAME:"nvram:/startup-config" $BACKUP_DIRECTORY/"startup-config-backup-$(date +"%y-%m-%d-%r")"



# FINE SCRIPT
