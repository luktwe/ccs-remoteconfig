# CISCO CATALYST SCRIPT

-----

## INTRODUCTION
This project includes a series of Bash script to manage and configure Cisco Catalyst enterprise switch.

---

## REQUIREMENTS

### CONNECTION

To connect via SSH to Cisco Catalyst 2960 Series is necessary enable Diffie-Hellman key-exchange protocol in host machine.
Simply paste this string into SSH global configuration file ``/etc/ssh/.ssh_config``:
```
KexAlgorithms +diffie-hellman-group1-sha1
```

and decomment line:
```
Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc
```


### EXECUTION

The script uses Bash interpreter: this is required to launch executable.

-----

## RESOURCES

Site:
- [Markdown Guide](https://www.markdownguide.org/)
- 
