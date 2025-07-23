# Verlihub FreeBSD port

Verlihub is a NMDC server for Unix & Linux based operating <br/>
systems that provides useful high level functionality such as:

  * Low RAM and CPU usage
  * It can hold more than 25.000 users
  * TLS secured connection via NMDCS protocol
  * Utility scripts for simple installation and hub management
  * Export and import of hub setting via MySQL
  * User management with privilegies
  * Logging of nicks and IPs
  * Clients and connection management
  * Extend functionality with Lua, Python (deprecated) and Perl (deprecated) scripts
  * Generate statistics for your hub
  * Import users from PtokaX, Aquila or YnHub
  * Plus much more

Dependencies installation<br>
```
gettext icu cmake openssl zlib pcre python27 perl lua54 lua-luafilesystem lua-luasec lua-luasocket libgcrypt libsysinfo libexecinfo libmaxminddb dialog4ports bash mariadb106-server
```
Links
==============

  * Website: https://github.com/verlihub
  * Wiki: https://github.com/verlihub/verlihub/wiki
  * Crash: https://crash.verlihub.net
  * Translate: https://transifex.com/feardc/verlihub
  * Ledokol: https://github.com/verlihub/ledokol
  * MMDB: https://ledo.feardc.net/mmdb
  * Proxy: https://github.com/verlihub/tls-proxy
  * Support: nmdcs://hub.verlihub.net:7777
  * Hublist: https://te-home.net/?do=hublist

:point_down: <br/>
_For versions older `1.6.0.0.947` you should install old icu-74 or later to compiling Verlihub at least_<br/>
_and for running Verlihub you can compile only libraries from icu-74 ;)_
