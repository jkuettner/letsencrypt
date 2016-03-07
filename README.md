# letsencrypt docker image

## Features
* get a new certificate from [letsencrypt](https://letsencrypt.org/)
* or renew all your [letsencrypt](https://letsencrypt.org/) certificates

## Installation
Simply clone this repository and build the docker image:
```sh
git clone https://github.com/jkuettner/letsencrypt.git
cd letsencrypt
docker build -t jkuettner/letsencrypt .
```

## Usage
### Get a new certificate
The following example will try to register a new letsencrypt certificate for the domains
- **domain.tld**
- **www.domain.tld**
- and **subdomain.domain.tld**

```sh
docker run --rm -ti \
    -v /path/to/your/webroot:/webroot \
    -v /path/to/ssl/target:/etc/letsencrypt \
    -e "DRY_RUN=1" \
    jkuettner/letsencrypt \
        -d domain.tld \
        -d www.domain.tld \
        -d subdomain.domain.tld
```
### Renew your letsencrypt certificates
To renew you created certificates simply run the image without any parameters:
```sh
docker run --rm -ti \
    -v /path/to/your/webroot:/webroot \
    -v /path/to/ssl/target:/etc/letsencrypt \
    -e "DRY_RUN=1" \
    jkuettner/letsencrypt
```

### Nice to know
- **/path/to/your/webroot** means the webroot of your domain - e.g. /var/www/domain.tld
- **/path/to/ssl/target** is the target directory for the registered ssl-certificates
- **-e "DRY_RUN=1"** will set the **--dry-run** parameter for the letsencrypt-auto command
- Make sure that your domain pointing to the correct webroot-dir
- After the command is complete the owner of /path/to/ssl/target will be changed to the uid 10000
