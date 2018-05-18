keep-in-foreground
interface="$INTERNAL_INTERFACE"
log-facility=-
log-queries
log-dhcp
no-hosts
dhcp-boot=http://provisioner-1.infra.local:8080/boot.ipxe
dhcp-range=192.168.1.100,192.168.1.254,30m
domain=infra.local
dhcp-host=08:00:27:ab:10:01,192.168.1.101,master-1.infra.local,infinite
dhcp-host=08:00:27:ab:10:02,192.168.1.102,master-2.infra.local,infinite
dhcp-host=08:00:27:ab:10:03,192.168.1.103,master-3.infra.local,infinite

dhcp-host=08:00:27:ab:10:10,192.168.1.110,worker-1.infra.local,infinite
dhcp-host=08:00:27:ab:10:11,192.168.1.111,worker-2.infra.local,infinite

address=/provisioner-1.infra.local/$INTERNAL_IP
address=/master-1.infra.local/192.168.1.101
address=/master-2.infra.local/192.168.1.102
address=/master-3.infra.local/192.168.1.103

address=/worker-1.infra.local/192.168.1.110
address=/worker-2.infra.local/192.168.1.111
