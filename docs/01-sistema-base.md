# Sistema Base

## Plataforma

| Item | Valor |
|---|---|
| SO | `KDE neon User Edition` |
| Release | `24.04` |
| Codename | `noble` |
| Kernel | `Linux 6.8.0-106-generic` |
| Arquitetura | `x86_64` |
| Virtualização | `kvm` |
| Modelo | `Standard PC i440FX + PIIX` |

## Recursos

Valores observados na coleta:

| Recurso | Valor |
|---|---|
| CPU | `4` núcleos lógicos |
| RAM total | `7.8 GiB` |
| Swap total | `4 GiB` |
| Disco raiz | `290 GiB` |
| Uso do disco raiz | ~`30%` |

## Serviços de Sistema Ativos

Principais serviços ativos observados:
- `docker.service`
- `containerd.service`
- `ssh.service`
- `fail2ban.service`
- `cron.service`
- `pm2-root.service`
- `monarx-agent.service`
- `NetworkManager.service`
- `systemd-resolved.service`
- `rsyslog.service`

Serviços presentes, mas menos relevantes para a stack web:
- `cups.service`
- `avahi-daemon.service`
- `fwupd.service`
- `ModemManager.service`
- `udisks2.service`
- `snapd.service`

## Versões de Runtime Relevantes

| Componente | Versão |
|---|---|
| Docker Engine | `29.3.1` |
| Docker Swarm | `active` |
| Node.js | `v24.14.0` |
| npm | `11.9.0` |
| PM2 | `6.0.14` |

## Segurança Básica Observada

- `ssh` ativo em `22`
- `ufw` ativo com política default `deny incoming`
- `fail2ban` ativo
- jail detectada para `sshd`
- jail detectada para `xrdp`, embora o serviço XRDP esteja hoje desativado

## Observações

- O host usa KDE neon e tem vários componentes de desktop instalados. Isso não impede os serviços, mas aumenta a superfície do sistema em comparação com uma distro mínima de servidor.
- `nginx` não apareceu como serviço ativo no estado atual. O tráfego HTTP/HTTPS está concentrado no `Traefik`.
