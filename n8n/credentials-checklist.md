# Checklist de Credenciales — n8n FinteChile

> IMPORTANTE: Este archivo NUNCA debe contener secretos, tokens o passwords reales.
> Solo es un inventario de que credenciales se necesitan y su estado.

## Credenciales Requeridas

| # | Servicio | Tipo Auth | Cuenta Owner | Estado | Notas |
|---|----------|-----------|-------------|--------|-------|
| 1 | Notion | Internal Integration Token | FinteChile | PENDIENTE | Crear desde notion.so/my-integrations |
| 2 | Gmail (envios) | OAuth2 | FinteChile | PENDIENTE | Usar cuenta operaciones@fintechile.org o similar |
| 3 | Google Calendar | OAuth2 | FinteChile | PENDIENTE | Misma cuenta Google |
| 4 | Google Drive | OAuth2 | FinteChile | PENDIENTE | Misma cuenta Google |
| 5 | Google Sheets | OAuth2 | FinteChile | PENDIENTE | Para migracion inicial, luego desactivable |
| 6 | Slack | Bot Token / OAuth2 | FinteChile | PENDIENTE | Crear Slack App en workspace FTC |
| 7 | HubSpot | API Key / OAuth2 | FinteChile | PENDIENTE | Solo si se mantiene HubSpot |
| 8 | Typeform/Tally | API Key | FinteChile | PENDIENTE | Segun herramienta de formularios |
| 9 | DocuSign | API Key | FinteChile | PENDIENTE | Opcional, si se integra |
| 10 | Eventbrite/Welcu | API Key | FinteChile | PENDIENTE | Para registro de eventos |

## Reglas de Seguridad
1. Todas las credenciales se crean desde cuentas de FinteChile
2. MBC Operator configura los workflows pero NO almacena tokens localmente
3. Los tokens se ingresan directamente en n8n por el Admin de FinteChile
4. Rotacion recomendada: cada 90 dias para API Keys, segun politica para OAuth
5. Documentar fecha de creacion y expiracion de cada credencial
6. Al hacer handover: revocar tokens de MBC, regenerar si es necesario

## Permisos Minimos por Credencial

### Notion Integration
- Permisos: Read/Write en databases especificas (no full workspace)
- Compartir la integracion solo con las DBs necesarias

### Gmail OAuth
- Scopes: `gmail.send`, `gmail.readonly` (NO `gmail.modify` ni `gmail.full`)

### Google Drive OAuth
- Scopes: `drive.file` (solo archivos creados por la app, no todo Drive)

### Slack Bot
- Scopes: `chat:write`, `channels:read`, `users:read`
- NO: `admin.*`, `files:write`
