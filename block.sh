BLOCKDB="IP.blocked"
IPS=$(grep -Ev "^#" $BLOCKDB)
iptables -F
./aws-ips
rm ip-ranges*
for i in $IPS
do
iptables -A INPUT -s $i -j DROP
iptables -A OUTPUT -d $i -j DROP
done
