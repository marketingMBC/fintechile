# Convenciones Notion — FinteChile OS v4

## Naming de Bases de Datos
- Formato: `[Icono] Nombre Descriptivo`
- Ejemplos: `Empresas Master`, `Contactos`, `Renovaciones`, `Eventos`, `Sponsors Pipeline`

## Naming de Paginas
- Documentos con fecha: `[YYYY-MM-DD] Titulo`
- Playbooks: `PB-NNN: Nombre del Playbook`
- Actas/minutas: `[YYYY-MM-DD] Minuta — Tema`

## Estados Estandar

### Empresas (Ciclo de Vida)
`Prospecto` → `En Revision` → `Aprobado` → `Formalizando` → `Activo` → `No Renovara` → `Retirado`

### Tareas
`Backlog` → `To Do` → `En Progreso` → `En Revision` → `Hecho`

### Contenidos
`Idea` → `Borrador` → `En Revision` → `Aprobado` → `Publicado`

### Sponsors Pipeline
`Lead` → `Contactado` → `Propuesta` → `Negociacion` → `Cerrado Won` → `Cerrado Lost`

### Eventos
`Planeacion` → `Confirmado` → `En Ejecucion` → `Completado` → `Cancelado`

### Automatizaciones
`En Desarrollo` → `Activo` → `Pausado` → `Deprecado`

## Prioridades
| Prioridad | Color Notion | Uso |
|-----------|-------------|-----|
| Urgente | Rojo | Requiere accion inmediata (hoy) |
| Alta | Naranja | Resolver esta semana |
| Media | Amarillo | Planificado, sin urgencia inmediata |
| Baja | Gris | Backlog, nice-to-have |

## Propiedades Obligatorias en Toda DB
- `Creado` (Created time) — automatico
- `Modificado` (Last edited time) — automatico
- `Creado por` (Created by) — automatico (donde aplique)

## ID Unico
- Empresas: **RUT** (formato XX.XXX.XXX-X para chilenas, numero fiscal para extranjeras)
- Contactos: **Email** como identificador funcional
- Renovaciones: **REN-[AÑO]-[NombreEmpresa]**
- Workflows: **FTC-WF-NNN**

## Reglas de Relaciones
- Empresa → Contactos: 1:N (una empresa, muchos contactos)
- Empresa → Renovaciones: 1:N (una empresa, muchos pagos)
- Empresa → Sponsors Pipeline: N:N (una empresa puede sponsorear varios eventos)
- Evento → Sponsors Pipeline: 1:N
- Evento → Tareas: 1:N
- Contenido → Empresa: N:1 (opcional)

## Verticals Oficiales (alineado con FinteChile)
1. Payments & Remittances
2. Financial & Digital Assets
3. Alternative Finance & Lending
4. Tech. Infrastructure for Finance and Insurance
5. Personal & Business Management
