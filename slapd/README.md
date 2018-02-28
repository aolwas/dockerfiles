## slapd

A basic configuration of the OpenLDAP server, slapd, with support for data
volumes.

This image will initialize a basic configuration of slapd. Most common schemas
are preloaded, but the only record added to the directory will be
the root organisational unit.

You can (and should) configure the following by providing environment variables
to `docker container run`:

- `SUFFIX` sets the LDAP root domain. (default: `dc=example,dc=org`)
- `ORGANISATION_NAME` sets the human-readable name for your organisation
  (default: `Example.org (c)`)
- `ROOT_PW` sets the LDAP admin user password (default `password`)
- `ROOT_USER` sets the LDAP admin user name (default: `admin`)

You can also use `MYVAR_FILE` env var with a file path to populate `MYVAR`
from a file in the container (a secret or a config in Swarm or k8s)

LDAP data are stored in */var/run/openldap*

slapd uses default insecure port on 389.



For example, to start a container running slapd for the `mycorp.com` domain,
with data stored in `/var/run/openldap` on the host, use the following:

``` bash
$ docker container run -v /data/ldap:/var/lib/ldap \
                       -e SUFFIX="dc=mycorp,dc=com" \
                       -e ORGANISATION_NAME="My Mega Corporation" \
                       -e ROOT_PW=s3cr3tpassw0rd \
                       -p 389 \
                       -d xamoc/slapd
```

You can find out which port the LDAP server is bound to on the host by running
`docker container ps` (or `docker container port <container_id> 389`). You could
then load an LDIF file (to set up your directory) like so:

    ldapadd -h <host> -p <host_port> -c -x -D cn=admin,dc=mycorp,dc=com -W -f data.ldif
