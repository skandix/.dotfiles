#!/bin/sh
cd /var/log/fail2ban
for k in $(cat fail2ban.log | cut -d' ' -f 19 | uniq | strings | egrep [0-9]+); do echo ; whois $k -H | egrep "(netname|descr|person|country|route)";echo ;done;