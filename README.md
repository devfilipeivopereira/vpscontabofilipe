# VPS Contabo Filipe

Documentação viva da VPS `167.86.110.57`, baseada em inspeção direta do servidor em `2026-04-21`.

Objetivo deste repositório:
- centralizar o inventário técnico da VPS
- registrar o que está realmente rodando
- documentar domínios, stacks, portas, volumes e caminhos de operação
- servir como referência para manutenção, troubleshooting e onboarding

Escopo desta documentação:
- sistema base da VPS
- rede, portas, firewall e domínios
- Docker Swarm e containers standalone
- serviços publicados e serviços internos
- app local sob PM2
- caminhos de dados/configuração
- alertas, sobras de configuração e pendências operacionais

Informações sensíveis:
- segredos, tokens, senhas e conteúdo de arquivos `.env` foram propositalmente omitidos
- a documentação referencia caminhos e estruturas, não os valores secretos

## Navegação

- [Inventário Geral](docs/00-inventario-geral.md)
- [Sistema Base](docs/01-sistema-base.md)
- [Rede, Domínios e Firewall](docs/02-rede-dominios-firewall.md)
- [Docker Swarm e Containers](docs/03-docker-swarm.md)
- [Traefik](docs/04-servicos/traefik.md)
- [n8n](docs/04-servicos/n8n.md)
- [Directus](docs/04-servicos/directus.md)
- [Evolution API](docs/04-servicos/evolution.md)
- [MinIO](docs/04-servicos/minio.md)
- [PgAdmin](docs/04-servicos/pgadmin.md)
- [Piwigo](docs/04-servicos/piwigo.md)
- [Portainer](docs/04-servicos/portainer.md)
- [Postgres Dedicado](docs/04-servicos/postgres.md)
- [Supabase](docs/04-servicos/supabase.md)
- [Uptime Kuma](docs/04-servicos/uptime-kuma.md)
- [Slides via PM2](docs/04-servicos/slides-pm2.md)
- [Operação, Caminhos e Comandos Úteis](docs/05-operacao-e-caminhos.md)
- [Pendências e Alertas](docs/06-pendencias-e-alertas.md)

## Resumo Executivo

Estado geral observado:
- VPS operacional
- Docker Swarm ativo
- Traefik servindo os domínios públicos em `80/443`
- SSH ativo em `22`
- XRDP desativado e porta `3389` fechada
- OpenClaw removido do runtime

Serviços públicos com resposta válida:
- `work.filipeivopereira.com` -> `n8n`
- `directus.filipeivopereira.com` -> `Directus`
- `evolution.filipeivopereira.com` -> `Evolution API`
- `minio.filipeivopereira.com` -> console MinIO
- `s3.filipeivopereira.com` -> endpoint S3/MinIO
- `pgadmin.filipeivopereira.com` -> PgAdmin
- `port.filipeivopereira.com` -> Portainer
- `supabase.filipeivopereira.com` -> gateway Supabase
- `fotos.igrejafamiliacrista.com` -> Piwigo

Serviços expostos diretamente por porta:
- `3000` -> app `slides` em PM2
- `3001` -> Uptime Kuma
- `8088` -> Piwigo

Observação importante:
- embora o `ufw` só permita explicitamente `22`, `80` e `443`, serviços Docker publicados em `3001` e `8088` aparecem em escuta no host; isso precisa ser considerado em qualquer revisão de segurança
