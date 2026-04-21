# Slides via PM2

## Função

Aplicação Node.js de apresentação de PDF sincronizada em tempo real.

## Execução

| Item | Valor |
|---|---|
| Gerenciador | `PM2` |
| Nome do processo | `slides` |
| Modo | `cluster` |
| Status | `online` |
| Porta local | `3000` |
| Diretório | `/var/www/slides-app` |
| Script | `/var/www/slides-app/server.js` |

## Projeto

`package.json` observado:
- nome: `cursor-presentation-app`
- versão: `1.0.0`
- stack: Node + Express + Socket.IO + PDF.js

Scripts:
- `npm start` -> `node server.js`
- `npm run dev` -> `nodemon server.js`

## Arquivos Relevantes

Em `/var/www/slides-app` foram detectados:
- `.env`
- `ecosystem.config.cjs`
- `server.js`
- `public/`
- `uploads/`
- `docs/`
- repositório `.git`

## Logs

Local dos logs PM2:
- `/root/.pm2/logs/slides-out-0.log`
- `/root/.pm2/logs/slides-error-0.log`

## Publicação

Situação real:
- a app responde localmente em `:3000`

Situação no Traefik:
- existe `slides.yml` em `/etc/traefik/dynamic`
- ele aponta `slides.filipeivopereira.com` para `http://76.13.168.1:3000`

Observação crítica:
- o upstream do arquivo dinâmico não corresponde a `127.0.0.1:3000`
- a conectividade desse upstream não foi validada com sucesso a partir da VPS durante esta coleta
- portanto, a app local existe e funciona, mas a publicação pública via Traefik precisa ser conferida
