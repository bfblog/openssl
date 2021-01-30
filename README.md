OpenSSL v1.1.1r Docker Image based in alpine linux.

# Introduction
The script **run-openssl.sh** is a wrapper to run the docker image **bfblog/openssl:latest**. The scripts mounts the scripts directory to the container working directory. As a result, the container can use the directory for input and ouput of parameters.
```
docker run -ti -v $VOLUME_PATH:/workspace bfblog/openssl:latest "$@"
```
# Usage
Run OpenSSL as interactive command:
```
shell> ./run.openssl.sh
OpenSSL> 
```
Pass **help** to OpenSSL and see help outputs: 
```
$ ./run-openssl.sh help
MACHINE=Cygwin
SCRIPT_PATH=/cygdrive/c/workspace/openssl
VOLUME_PATH=C:\workspace\openssl
openssl args=help
Standard commands
asn1parse         ca                ciphers           cms
crl               crl2pkcs7         dgst              dhparam
dsa               dsaparam          ec                ecparam
enc               engine            errstr            gendsa
genpkey           genrsa            help              list
nseq              ocsp              passwd            pkcs12
pkcs7             pkcs8             pkey              
...
```
# Example
Create the private key:
```
shell> ./run-openssl.sh req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/O=boutiquestore Inc./CN=boutiquestore.com'
$ ./run-openssl.sh req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj '/O=boutiquestore Inc./CN=boutiquestore.com'
MACHINE=Cygwin
SCRIPT_PATH=/cygdrive/c/workspace/openssl
VOLUME_PATH=C:\workspace\openssl
openssl args=req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj /O=boutiquestore Inc./CN=boutiquestore.com
Generating a RSA private key
.............+++++
..........................+++++
writing new private key to 'privkey.pem'
-----
-----BEGIN CERTIFICATE-----
MIIDUzCCAjugAwIBAgIUO5UdP1JBglpm4q99OlxUj9CgMcwwDQYJKoZIhvcNAQEL
BQAwOTEbMBkGA1UECgwSYm91dGlxdWVzdG9yZSBJbmMuMRowGAYDVQQDDB...
KQaGda7G7BPIgiVJnDYSxZNPac9
fSTNHWa2xvbHskNN7BNJNB17rZW4wrT89r0IsR9BA77B6OEdIqFT
-----END CERTIFICATE-----
```
The certificate sign request:
```
shell> ./run-openssl.sh req -out server.csr -newkey rsa:2048 -nodes -keyout server.key -subj "/CN=marketplace.boutiquestore.com/O=boutique store"
MACHINE=Cygwin
SCRIPT_PATH=/cygdrive/c/workspace/openssl
VOLUME_PATH=C:\workspace\openssl
openssl args=req -out server.csr -newkey rsa:2048 -nodes -keyout server.key -subj /CN=marketplace.boutiquestore.com/O=boutique store
Generating a RSA private key
............................+++++
....................+++++
writing new private key to 'server.key'
-----
```
The first call creates the file **privkey.pem**. The second call creates the files **server.csr** and **server.key**.
```
shell> ls
Dockerfile  Makefile  privkey.pem  README.md  run-openssl.sh  server.csr  server.key
```