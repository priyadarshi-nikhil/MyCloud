;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	ns1.mycloud.com. admin.mycloud.com. (
			      6		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
; name servers - NS records
    IN	    NS	    ns1.mycloud.com.
    IN      NS      ns2.mycloud.com.

; name servers - A records
ns1.mycloud.com.               IN      A       10.0.3.119
ns2.mycloud.com.               IN      A       10.0.3.93

; 10.0.3.0/24 - A records
MariaDB-lxc.mycloud.com.           IN      A      10.0.3.51
cloud-lxc.mycloud.com.             IN      A      10.0.3.231
mail-admin.mycloud.com.            IN      A      10.0.3.232
test.mycloud.com.                  IN      A      10.0.3.146
logger.mycloud.com.		   IN      A	  10.0.3.34
shinken.mycloud.com.		   IN      A      10.0.3.91
testservers.nginx.mycloud.com.     IN      A      10.0.3.162
