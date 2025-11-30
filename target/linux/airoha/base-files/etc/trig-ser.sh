#!/bin/sh

DIR=/sys/kernel/debug/ieee80211/phy0/mt76/

echo 0x00401484 > $DIR/regidx
echo 0x15100002 > $DIR/regval
echo '0,1' > $DIR/sys_recovery
