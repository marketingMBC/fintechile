# Naming Convention — n8n Workflows FinteChile

## Formato de Nombre
```
FTC-WF-NNN_nombre-descriptivo
```
- **FTC**: Prefijo cliente (FinteChile)
- **WF**: Tipo (Workflow)
- **NNN**: Numero secuencial (001, 002...)
- **nombre-descriptivo**: kebab-case, maximo 30 caracteres

## Folders en n8n
```
/Core           → Flujos criticos de negocio (001-003)
/Eventos        → Flujos relacionados con Forum y eventos (004, etc.)
/Comunicaciones → Reportes, contenidos, newsletters (005, 007)
/Operaciones    → Tareas, onboarding, Drive (006, 008, 009)
/Sistema        → Health checks, backups, monitoreo (010+)
```

## Catalogo Actual
| ID | Nombre | Folder | Criticidad |
|----|--------|--------|-----------|
| FTC-WF-001 | alta-asociado | /Core | Alta |
| FTC-WF-002 | pipeline-sponsor | /Core | Alta |
| FTC-WF-003 | recordatorio-renovacion | /Core | Alta |
| FTC-WF-004 | forum-registro | /Eventos | Alta |
| FTC-WF-005 | reporte-semanal | /Comunicaciones | Media |
| FTC-WF-006 | alerta-tareas-vencidas | /Operaciones | Media |
| FTC-WF-007 | contenidos-aprobacion | /Comunicaciones | Media |
| FTC-WF-008 | drive-carpeta-auto | /Operaciones | Media |
| FTC-WF-009 | onboarding-miembro | /Operaciones | Media |
| FTC-WF-010 | health-check | /Sistema | Baja |

## Notas en Nodos n8n
- Cada workflow debe tener un nodo "Sticky Note" al inicio con:
  - Nombre completo del workflow
  - Descripcion breve
  - Owner
  - Fecha de creacion
  - Version

## Variables de Entorno
- Usar variables de n8n (no hardcodear):
  - `NOTION_DB_EMPRESAS_ID`
  - `NOTION_DB_CONTACTOS_ID`
  - `SLACK_CHANNEL_OPS`
  - `SLACK_CHANNEL_EJECUTIVO`
  - `EMAIL_FROM`
  - `DRIVE_FOLDER_MIEMBROS_ID`
