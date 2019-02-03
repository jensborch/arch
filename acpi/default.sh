#!/bin/sh
set $*
group=${1%%/*}
device=$2
id=$3
value=$4
log_unhandled() {
       logger "ACPI event unhandled: $*"
}
case "$group" in
       button)
               case "$action" in
                       power)
                               /etc/acpi/actions/powerbtn.sh
                               ;;
                       lid)
                               /etc/acpi/actions/lid.sh
                               ;;
                       *)      log_unhandled $* ;;
               esac
               ;;
       ac_adapter)
               case "$value" in
                       *)      log_unhandled $* ;;
               esac
               ;;
       *)      echo $* > /dev/tty5
               log_unhandled $* ;;
esac
