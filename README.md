# AutoPrivoxy

Automatic Installer for Privoxy.

This script will install privoxy and set it to accept connections only to your IP.
If you want to allow access to everyone please comment out the last line in /etc/privoxy/config

## Usage
`````
curl -O https://raw.githubusercontent.com/techroy23/AutoPrivoxy/master/AutoPrivoxy.sh

chmod +x AutoPrivoxy.sh

./AutoPrivoxy.sh
`````
## Compatibility

The script supports these OS and architectures:

|              | i386 | amd64 |
| ------------ | ---- | ----- |
|  Arch Linux  |   ❔  |  ❔  | 
|   CentOS 7   |   ❔  |  ❔  |
|   Debian 8   |   ✅  |  ✅  |
|   Debian 9   |   ✅  |  ✅  |
|   Debian 10  |   ✅  |  ✅  |
|   Fedora 27  |   ❔  |  ❔  |
|   Fedora 28  |   ❔  |  ❔  |
| Ubuntu 16.04 |   ✅  |  ✅  |
| Ubuntu 18.04 |   ✅  |  ✅  |
| Ubuntu 19.04 |   ✅  |  ✅  |
