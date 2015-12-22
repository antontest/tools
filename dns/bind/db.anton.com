$TTL 604800
@       IN      SOA         anton.com. root.anton.com. (
                1           ; Serial
                604800      ; Refresh
                86400       ; Retry
                2419200     ; Expire
                604800 )    ; Negative Cache TTL
;
@       IN  NS      ns.anton.com.
@       IN  A       192.168.0.102
ns      IN  A       192.168.0.102
test    IN  A       192.168.0.102
www     IN  A       192.168.0.102
