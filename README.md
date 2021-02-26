# Jitsi OpenID

[![Releases](https://img.shields.io/github/v/tag/MarcelCoding/jitsi-openid?label=latest%20version&style=flat-square)](https://github.com/marcelcoding/jitsi-openid/releases)
[![Build](https://img.shields.io/github/workflow/status/MarcelCoding/jitsi-openid/CI?label=CI&style=flat-square)](https://github.com/marcelcoding/jitsi-openid/actions)
[![DockerHub](https://img.shields.io/docker/pulls/marcelcoding/jitsi-openid?style=flat-square)](https://hub.docker.com/r/marcelcoding/jitsi-openid)

Jitsi OpenID is an authentication adapter to provide [jitsi](https://jitsi.org/) the ability to use single sign on
via [OpenID Connect](https://openid.net/connect/).

## Deployment

This image is available in [DockerHub](https://hub.docker.com/r/marcelcoding/jitsi-openid) and the
[GitHub Container Registry](https://github.com/users/MarcelCoding/packages/container/package/jitsi-openid):

```
marcelcoding/jitsi-openid:latest
ghcr.io/marcelcoding/jitsi-openid:latest
```

### Docker "run" Command

```bash
docker run \
  -p 3000:3000 \
  -e JITSI_SECRET=SECURE_SECRET \
  -e JITSI_URL=https://meet.example.com \
  -e JITSI_ID=meet.example.com \
  -e ISSUER_BASE_URL=https://id.example.com \
  -e BASE_URL=https://auth.meet.example.com \
  -e CLIENT_ID=meet.example.com \
  -e SECRET=SECURE_SECRET \
  --restart always \
  --rm \
  marcelcoding/jitsi-openid:latest
```

### Docker Compose

````yaml
# docker-compose.yaml
version: '3.8'

services:
  jitsi-openid:
    image: marcelcoding/jitsi-openid:latest
    restart: always
    environment:
      - 'JITSI_SECRET=SECURE_SECRET'             # <- shared with jitsi (JWT_APP_SECRET),
                                                 #    secret to sign jwt tokens
      - 'JITSI_URL=https://meet.example.com'     # <- external url of jitsi
      - 'JITSI_ID=meet.example.com'              # <- shared with jitsi (JWT_APP_ID),
                                                 #    id of jitsi
      - 'ISSUER_BASE_URL=https://id.example.com' # <- base URL of your OpenID Connect provider
                                                 #    Keycloak: https://id.example.com/auth/realms/<realm>
      - 'BASE_URL=https://auth.meet.example.com' # <- base URL of this application
      - 'CLIENT_ID=meet.example.com'             # <- OpenID Connect Client ID
      - 'SECRET=SECURE_SECRET'                   # <- OpenID Connect Client secret
    ports:
      - '3000:3000'
````

## License

[LICENSE](LICENSE)
