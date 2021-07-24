#!/bin/bash

# QUESTO SCRIPT ABILITA LA CONNESSIONE ssh TRAMITE L'ESECUZIONE DI COMANDI VIA telnet
# SCRIPT PRECONFIGURATO PER CONNESSIONE telnet ALLO SWITCH csw001 CON UTENTE user

# PER ESEGUIRE LO SCRIPT BISOGNA ABILITARE LA CONFIGURAZIONE (config)file prompt quiet SULLO SWITCH
# PER ESEGUIRE LO SCRIPT BISOGNA ABILITARE telnet SULLO SWITCH



# IMPOSTARE IP O HOSTNAME DEL NODO SUL QUALE CI SI VUOLE COLLEGARE IN telnet
REMOTE_HOSTNAME=csw001

# IMPOSTARE UN UTENTE DELLO SWITCH CON PREABILITAZIONI ALLA CONNESSIONE telnet
REMOTE_USERNAME=user

# IMPOSTARE LA PASSWORD DI AUTENTICAZIONE ALLO SWITCH
REMOTE_PASSWORD=password



# IMPOSTARE I PARAMETRI DI CONFIGURAZIONE PER ssh
# DIMENSIONE CHIAVE
REMOTE_KEY_SIZE=1024

# PASSWORD PER ACCESSO AI PROTOCOLLI
REMOTE_PROTOCOL_PASSWORD=protocol_password

# PROTOCOLLI (INSERIRE PARAMETRI DIVISI DA UNO SPAZIO)
REMOTE_PROTOCOL="ssh telnet"



(

echo $REMOTE_USERNAME

echo $REMOTE_PASSWORD

echo "configure terminal"
sleep 1

echo "crypto key generate rsa"
sleep 1

# SOSTITUISCE LA CHIAVE rsa ESISTENTE
echo "yes"
sleep 1

# IMPOSTA LA DIMENSIONE DELLA CHIAVE
echo "$REMOTE_KEY_SIZE"
sleep 1

# IMPOSTA line vty
echo "line vty 0 15"
sleep 1

# IMPOSTA I PROTOCOLLI DA ABILITARE
echo "transport input $REMOTE_PROTOCOL"
sleep 1

echo "login local"
sleep 1

# IMPOSTA LA PASSWORD
echo "password $REMOTE_PROTOCOL_PASSWORD"
sleep 1

echo "exit"
sleep 1

# ABILITA ssh VERSIONE 2
echo "ip ssh version 2"
sleep 1

# ABILITA SECURE COPY PROTOCOL
echo "ip scp server enable"
sleep 1

echo "do wr"
sleep 1

echo "exit"
sleep 1

# MOSTRA CONFIGURAZIONE ssh
echo "show ip ssh"
sleep 1

# CHIUDE CONNESSIONE
echo "exit"
sleep 1

) | telnet $REMOTE_HOSTNAME



# FINE SCRIPT







