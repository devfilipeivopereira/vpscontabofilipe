# Pendências e Alertas

## 1. Configuração dinâmica antiga do OpenClaw no Traefik

Arquivo detectado:
- `/etc/traefik/dynamic/openclaw.yml`

Situação:
- o runtime do OpenClaw foi removido da VPS
- a rota dinâmica ainda existe no Traefik

Impacto:
- documentação e configuração ficam divergentes
- risco de confusão futura em troubleshooting

## 2. Rota dinâmica do Slides parece inconsistente

Arquivo:
- `/etc/traefik/dynamic/slides.yml`

Upstream configurado:
- `http://76.13.168.1:3000`

Enquanto isso, a app local PM2 roda em:
- `*:3000`
- diretório `/var/www/slides-app`

Impacto:
- a publicação pública de `slides.filipeivopereira.com` precisa ser validada e provavelmente ajustada

## 3. UFW não representa toda a superfície publicada pelo Docker

Situação:
- `ufw` mostra apenas `22`, `80` e `443`
- `3001` e `8088` seguem publicados por Docker

Impacto:
- falsa sensação de exposição menor do que a real
- qualquer revisão de segurança precisa considerar `docker-proxy` e iptables

## 4. XRDP foi desativado, mas ainda existe jail no Fail2Ban

Situação:
- `xrdp` e `xrdp-sesman` estão desativados
- o Fail2Ban ainda lista jail `xrdp`

Impacto:
- não é crítico
- mas é configuração residual que pode ser revisada

## 5. n8n sem mount persistente aparente nos serviços principais

Situação:
- `docker service inspect` do `n8n_editor`, `n8n_webhook` e `n8n_worker` não mostrou mounts persistentes

Impacto:
- merece confirmação arquitetural
- se a persistência depender de outro backend, isso precisa ser explicitado em documentação complementar

## 6. Host de servidor não minimalista

O host roda KDE neon com componentes de desktop, CUPS, Avahi e outros serviços não estritamente necessários para uma VPS web.

Impacto:
- maior superfície de manutenção
- mais processos do que uma imagem dedicada de servidor

## 7. Projetos locais fora do runtime documentado

Detectados:
- `/root/moltbot`
- `/opt/message-sender-pro`

Impacto:
- não são necessariamente problema
- mas fazem parte do inventário real da VPS e merecem classificação futura entre:
  `produção`, `teste`, `desenvolvimento` ou `arquivo`

## 8. Snapshot do Portainer não cobre tudo o que está em produção

As compose files detectadas em `portainer_data/_data/compose` cobrem:
- `postgres`
- `n8n`
- `supabase`
- `evolution`
- `minio`
- `directus`
- `pgadmin`

Não apareceram nesse conjunto:
- `traefik`
- `portainer`
- `piwigo`
- `uptime-kuma`

Impacto:
- uma restauração baseada apenas no Portainer fica incompleta
- o runbook de recuperação precisa combinar snapshots do Portainer com artefatos do host

## 9. Divergência entre compose salva e imagem em execução no Supabase Studio

Comparativo observado:
- compose do Portainer: `supabase/studio:2026.01.27-sha-2a37755`
- serviço em execução: `supabase/studio:2025.11.10-sha-5291fe3`

Impacto:
- um restore pelo YAML do Portainer pode subir uma versão diferente da atualmente executada
- antes de restaurar a stack `supabase`, vale decidir se a referência correta será a compose salva ou o estado realmente em produção
