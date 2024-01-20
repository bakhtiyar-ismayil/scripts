#!/bin/bash

# Replace with your SNMPv3 parameters
TARGET_IP='172.13.0.2'
SNMP_USER='snmpcheck'
SNMP_AUTH_PROTOCOL='SHA'  # Options: MD5, SHA
SNMP_AUTH_PASSPHRASE='snmpcheck_for_test'
SNMP_PRIV_PROTOCOL='AES'  # Options: DES, AES
SNMP_PRIV_PASSPHRASE='snmp_check'

# Perform SNMPv3 walk
snmpwalk -v 3 -u "$SNMP_USER" -a "$SNMP_AUTH_PROTOCOL" -A "$SNMP_AUTH_PASSPHRASE" -x "$SNMP_PRIV_PROTOCOL" -X "$SNMP_PRIV_PASSPHRASE" "$TARGET_IP"

