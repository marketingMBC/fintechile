# MetaBuild Smart — Master Plan Operativo
## FinteChile x Meta Build City
**Versión:** 1.0
**Fecha:** 2025-02-14
**Autor:** Meta Build City (MBC)
**Estado:** Borrador para revisión interna

---

# A) DESCUBRIMIENTO ESTRUCTURADO

## A.1 — Preguntas Criticas para FinteChile (Pre-Implementacion)

### Bloque 1: Datos y Sistemas Actuales
1. **¿Cual es el estado actual de la "Master" en Google Sheets?** ¿Cuantas empresas activas hay hoy (Asociados + Partners)? ¿Cuantos registros en Prospeccion y Nuevas Empresas?
2. **¿Que otros Sheets/Docs/Drives existen** fuera de la Master que manejen datos operativos? (ej. planillas de sponsors Chile Fintech Forum, calendarios de contenido, presupuestos).
3. **¿Usan HubSpot activamente como CRM** o solo como receptor de formularios? ¿Tienen plan pagado o free? ¿Quieren mantenerlo, reemplazarlo, o solo capturar datos desde el?
4. **¿Que herramientas de comunicacion usan internamente?** (Slack, WhatsApp, email) ¿Y con los asociados/partners? (newsletters via Mailchimp/SendGrid, comunidad digital — ¿en que plataforma?).

### Bloque 2: Flujos Urgentes y Prioridades
5. **¿Cuales son los 3 procesos que mas dolor generan hoy?** (ej. ingreso manual desde HubSpot, seguimiento de renovaciones, gestion del Forum). Ranking de urgencia.
6. **Chile Fintech Forum 2025: ¿hay fecha confirmada?** ¿Que procesos del Forum necesitan automatizacion? (registro, sponsors, speakers, logistica, post-evento).
7. **¿Existe un proceso formal de onboarding de nuevos asociados** o es ad-hoc? ¿Que pasos se hacen hoy manualmente post-aprobacion del Directorio?

### Bloque 3: Equipo, Roles y Permisos
8. **¿Quien sera el "owner" operativo del proyecto** dentro de FinteChile? (punto de contacto diario, aprobador de cambios). ¿Y el sponsor ejecutivo (CEO/Directorio)?
9. **Mapa de equipo y accesos:** ¿Quienes necesitan acceso al workspace Notion y con que nivel? Confirmar roles: CEO, Guild Manager, Comunicaciones, Sinergias, Admin/Finanzas, Disenador.
10. **¿Hay personas externas** (consultores, directorio, proveedores) que necesiten acceso limitado a informacion?

### Bloque 4: Compliance y Datos Sensibles
11. **DECISION REQUERIDA — Datos personales (RUT, correos, telefonos):** ¿FinteChile tiene politica de proteccion de datos? ¿Hay consentimiento explicito de los asociados para migrar datos a una nueva plataforma? Considerar Ley 19.628 (Chile) y si aplica alguna regulacion sectorial.
12. **¿Quien es dueno de las cuentas actuales** de Google Workspace, HubSpot, DocuSign, dominio? ¿Estan bajo FinteChile o bajo alguna persona natural?

### Bloque 5: Expectativas y Restricciones
13. **¿Ya tienen workspace de Notion** o se crea desde cero? Si existe, ¿que plan tienen (Free/Plus/Business)?
14. **Presupuesto para herramientas:** ¿Hay disponibilidad para Notion Business (~$10 USD/usuario/mes) y n8n Cloud (~$20-50 USD/mes) o se prefiere self-hosted?
15. **¿Cual es el hito mas importante de los primeros 30 dias?** ¿Migrar la Master? ¿Tener el pipeline de sponsors listo? ¿Preparar el Forum?

---

## A.2 — Supuestos de Trabajo (hasta confirmar con FinteChile)

| # | Supuesto | Riesgo si es incorrecto | Estado |
|---|----------|------------------------|--------|
| S1 | FinteChile no tiene workspace Notion existente; se crea nuevo | Bajo — si existe, se migra | SUPUESTO |
| S2 | La Master en Sheets es la fuente de verdad principal de miembros | Medio — puede haber datos en HubSpot | SUPUESTO |
| S3 | Equipo de ~8 personas necesita acceso a Notion | Bajo — afecta licenciamiento | SUPUESTO |
| S4 | HubSpot se usa solo para captura de formularios, no como CRM completo | Medio — si es CRM activo, cambia la arquitectura | SUPUESTO |
| S5 | No hay restricciones de compliance que impidan usar Notion (cloud US/EU) | Alto — si hay restriccion regulatoria, se necesita alternativa | SUPUESTO |
| S6 | Chile Fintech Forum 2025 es en S2 del ano; hay tiempo para montar pipeline | Medio — si es en Q1, prioridad cambia | SUPUESTO |
| S7 | Se prefiere n8n Cloud (managed) sobre self-hosted | Bajo — solo cambia deployment | SUPUESTO |
| S8 | Slack es el canal de comunicacion interna del equipo | Bajo — puede ser WhatsApp | SUPUESTO |
| S9 | DocuSign se mantiene para contratos; no se reemplaza | Bajo | SUPUESTO |
| S10 | Google Workspace (Gmail, Drive, Calendar) se mantiene como stack base | Bajo | CONFIRMADO (inferido de Manual v1.5) |

---

## A.3 — Mapa de Sistemas Actual (Estimado)

```
┌─────────────────────────────────────────────────────────────────┐
│                    MAPA DE SISTEMAS FINTECHILE                  │
│                        (Estado actual estimado)                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐      │
│  │   HubSpot    │───>│  Plat. de    │───>│   Google     │      │
│  │  (Forms /    │    │   Pegado     │    │   Sheets     │      │
│  │  Leads CRM)  │    │  (manual)    │    │  "LA MASTER" │      │
│  └──────────────┘    └──────────────┘    └──────┬───────┘      │
│                                                  │              │
│                                    ┌─────────────┼──────────┐  │
│                                    │             │          │  │
│                              ┌─────▼─────┐ ┌────▼────┐ ┌───▼──┐
│                              │Prospeccion │ │Empresas │ │Renov.│
│                              │(53 cols)   │ │(activos)│ │(pagos)│
│                              └────────────┘ └─────────┘ └──────┘
│                              ┌────────────┐ ┌─────────┐        │
│                              │ Contactos  │ │ Salida  │        │
│                              │ (1:N)      │ │Empresas │        │
│                              └────────────┘ └─────────┘        │
│                                                                 │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐      │
│  │Google Drive  │    │   Gmail /    │    │  DocuSign    │      │
│  │(docs, fotos, │    │  Calendar    │    │ (contratos)  │      │
│  │ presentac.)  │    │              │    │              │      │
│  └──────────────┘    └──────────────┘    └──────────────┘      │
│                                                                 │
│  ┌──────────────┐    ┌──────────────┐    ┌──────────────┐      │
│  │    Slack     │    │  RRSS       │    │  ¿Typeform/  │      │
│  │ (interno +   │    │ (LinkedIn,  │    │   Tally?     │      │
│  │ comunidad?)  │    │ IG, YT)     │    │ (forms ext.) │      │
│  └──────────────┘    └──────────────┘    └──────────────┘      │
│                                                                 │
│  ┌──────────────┐    ┌──────────────┐                          │
│  │  Plataforma  │    │  ¿Otro CRM  │                          │
│  │  de eventos  │    │  o ERP?     │                          │
│  │  (¿Eventbrite│    │  (por       │                          │
│  │  /Welcu?)    │    │  confirmar) │                          │
│  └──────────────┘    └──────────────┘                          │
└─────────────────────────────────────────────────────────────────┘

Flujo de datos principal:
HubSpot Form → Email → Pegado manual → Prospeccion → [Aprobacion] →
Nuevas Empresas → [Pago+Contrato] → Empresas (activo) → Renovacion/Contactos → Salida

ID unico del sistema: RUT Empresa
Automatizacion actual: Google Apps Script (semi-automatizado, confirmacion manual)
```

---

# B) ARQUITECTURA Y OWNERSHIP (Enterprise-Ready)

## B.1 — Arquitectura Recomendada

```
┌─────────────────────────────────────────────────────────────────────┐
│                  ARQUITECTURA MetaBuild Smart v1                    │
│               (Client-Owned / MBC con permisos delegados)           │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  CAPA DE DATOS (Propiedad: FinteChile)                             │
│  ┌───────────────────────────────────────────────────────────┐     │
│  │                   NOTION WORKSPACE                        │     │
│  │                (Plan Business recomendado)                 │     │
│  │                                                           │     │
│  │  ┌─────────┐ ┌──────────┐ ┌────────┐ ┌───────────┐      │     │
│  │  │Empresas │ │Contactos │ │Eventos │ │Sponsors/  │      │     │
│  │  │(Master) │ │(Personas)│ │(Forum +│ │Partners   │      │     │
│  │  │         │ │          │ │otros)  │ │Pipeline   │      │     │
│  │  └─────────┘ └──────────┘ └────────┘ └───────────┘      │     │
│  │  ┌─────────┐ ┌──────────┐ ┌────────┐ ┌───────────┐      │     │
│  │  │Tareas / │ │Contenido │ │Docs /  │ │Automati-  │      │     │
│  │  │Ops      │ │& Comms   │ │Playbooks│ │zaciones   │      │     │
│  │  └─────────┘ └──────────┘ └────────┘ └───────────┘      │     │
│  └───────────────────────────────────────────────────────────┘     │
│                              │                                      │
│  CAPA DE AUTOMATIZACION      │ (Propiedad: FinteChile)             │
│  ┌───────────────────────────┴───────────────────────────────┐     │
│  │                      n8n CLOUD                            │     │
│  │              (cuenta bajo email FinteChile)                │     │
│  │                                                           │     │
│  │  Workflows:                                               │     │
│  │  [Alta Asociado] [Pipeline Sponsor] [Renovaciones]        │     │
│  │  [Contenidos] [Forum: Registro] [Alertas/KPIs]           │     │
│  │                                                           │     │
│  │  Credenciales: tokens de Notion, Gmail, Slack, Drive      │     │
│  │  (almacenadas en n8n, nunca compartidas con MBC)          │     │
│  └───────────────────────────────────────────────────────────┘     │
│                              │                                      │
│  CAPA DE CONECTORES          │                                      │
│  ┌───────────────────────────┴───────────────────────────────┐     │
│  │                                                           │     │
│  │  ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐            │     │
│  │  │ Gmail  │ │Calendar│ │ Slack  │ │Google  │            │     │
│  │  │(envios,│ │(eventos│ │(alertas│ │Drive   │            │     │
│  │  │notif.) │ │reuniones│ │canales)│ │(docs)  │            │     │
│  │  └────────┘ └────────┘ └────────┘ └────────┘            │     │
│  │  ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐            │     │
│  │  │HubSpot │ │DocuSign│ │Typeform│ │Evento  │            │     │
│  │  │(forms) │ │(firma) │ │/Tally  │ │(Welcu/ │            │     │
│  │  │        │ │        │ │        │ │Evtbrite)│            │     │
│  │  └────────┘ └────────┘ └────────┘ └────────┘            │     │
│  └───────────────────────────────────────────────────────────┘     │
│                                                                     │
│  CAPA DE OPERACION MBC                                             │
│  ┌───────────────────────────────────────────────────────────┐     │
│  │  MBC Operator (permisos delegados, revocables)            │     │
│  │  - Acceso a Notion como "Member" (no Owner/Admin)         │     │
│  │  - Acceso a n8n como "Editor" (no Owner)                  │     │
│  │  - Sin acceso a credenciales de produccion directamente   │     │
│  │  - Logs de actividad visibles para FinteChile             │     │
│  └───────────────────────────────────────────────────────────┘     │
└─────────────────────────────────────────────────────────────────────┘
```

### Principios de Arquitectura
1. **Client-Owned:** Todas las cuentas (Notion, n8n, conectores) bajo email/dominio de FinteChile
2. **Least Privilege:** MBC opera con permisos minimos necesarios, revocables en cualquier momento
3. **Portabilidad:** Todo exportable (Notion markdown, n8n JSON, docs en Drive)
4. **Sin vendor lock-in:** Notion y n8n son reemplazables; la logica queda documentada

---

## B.2 — Seguridad y Permisos (RBAC)

| Rol | Notion | n8n | Drive | Slack | Gmail/Calendar |
|-----|--------|-----|-------|-------|----------------|
| **Admin FinteChile** (CEO) | Workspace Owner | Instance Owner | Full | Workspace Admin | Full |
| **Operaciones** (Guild Manager) | Full Member | Editor | Carpetas asignadas | Canales internos | Propia cuenta |
| **Marketing/Comms** | Full Member (areas Comms) | Viewer | Carpetas comms | Canales comms | Propia cuenta |
| **Sinergias/Eventos** | Full Member (areas Eventos) | Viewer | Carpetas eventos | Canales eventos | Propia cuenta |
| **Admin/Finanzas** | Full Member (area Finanzas) | Viewer | Carpetas finanzas | Canal finanzas | Propia cuenta |
| **Disenador** | Member (solo lectura + comms) | Sin acceso | Carpeta assets | Canal diseno | Sin acceso |
| **Partners/Externos** | Guest (paginas especificas) | Sin acceso | Sin acceso | Canal publico | Sin acceso |
| **MBC Operator** | Member (edit, no admin) | Editor (no owner) | Carpeta MBC | Canal #mbc-ops | Sin acceso |

### Reglas clave:
- Credenciales de API/OAuth se crean desde cuentas FinteChile, no MBC
- MBC no tiene acceso a Gmail, DocuSign ni datos financieros directos
- Audit log de Notion (Business plan) activado
- Rotacion de tokens cada 90 dias (recordatorio automatizado)

---

## B.3 — Plan de Continuidad y Handover

### Backups y Versionado
- **Notion:** Export semanal automatizado (CSV + Markdown) via n8n → Google Drive
- **n8n Workflows:** Export JSON mensual al repositorio/Drive, versionado con fecha
- **Docs:** Todo en Google Drive de FinteChile (carpeta `/MetaBuild Smart/`)
- **Logs:** n8n guarda execution logs (30 dias en cloud); resumen mensual en Notion

### Monitoreo y Alertas
- Workflow de "health check" en n8n: verifica diariamente que las automatizaciones criticas estan activas
- Alerta a Slack #ops si un workflow falla 2+ veces consecutivas
- Reporte semanal automatico: workflows ejecutados, errores, tareas vencidas

### Plan de Salida (Handover Pack)
Si la mantención termina, MBC entrega:

| Entregable | Formato | Contenido |
|-----------|---------|-----------|
| Documentacion de arquitectura | PDF + Notion | Diagrama actual, decisiones, flujos |
| Export completo Notion | Markdown + CSV | Todas las DBs, paginas, templates |
| Export n8n workflows | JSON | Todos los flujos con documentacion inline |
| Runbooks operativos | Markdown/PDF | Paso a paso para cada proceso critico |
| Inventario de credenciales | Checklist (sin datos) | Lista de que tokens existen, donde, cuando expiran |
| Sesion de transferencia | Video (1-2 hrs) | Walkthrough en vivo del sistema |
| Soporte post-handover | 30 dias email | Consultas puntuales de transicion |

---

## B.4 — Estructura del Repositorio/Documentacion

```
/FinteChile (carpeta raiz del proyecto)
│
├── /docs
│   ├── 00-MASTER-PLAN-MetaBuild-Smart.md    ← este documento
│   ├── 01-arquitectura.md                    ← diagrama + decisiones
│   ├── 02-flujos-operativos.md               ← detalle de cada flujo
│   ├── 03-runbooks/                          ← guias paso a paso
│   │   ├── runbook-alta-asociado.md
│   │   ├── runbook-renovacion.md
│   │   └── runbook-forum-registro.md
│   ├── 04-handover-pack.md                   ← checklist de salida
│   ├── 05-RACI.md                            ← matriz de responsabilidades
│   ├── Manual v.1.5.txt                      ← doc fuente (referencia)
│   ├── Manual v.2.0.pptx                     ← doc fuente (referencia)
│   └── Join_FinteChile-ASSOCIATES-EN.pdf     ← doc fuente (referencia)
│
├── /notion
│   ├── schema-empresas.md                    ← propiedades, relaciones
│   ├── schema-contactos.md
│   ├── schema-eventos.md
│   ├── schema-sponsors.md
│   ├── templates/                            ← templates de Notion
│   └── convenciones.md                       ← naming, estados, IDs
│
├── /n8n
│   ├── workflows/                            ← exports JSON
│   │   ├── FTC-WF-001_alta-asociado.json
│   │   ├── FTC-WF-002_pipeline-sponsor.json
│   │   └── ...
│   ├── naming-convention.md                  ← reglas de nombrado
│   └── credentials-checklist.md              ← placeholders, nunca secretos
│
├── /assets
│   ├── diagramas/
│   └── capturas/
│
└── /contracts
    └── anexo-tecnico-template.md
```

---

# C) NOTION OS v4 — Diseno del Workspace

## C.1 — Sitemap del Workspace

```
🏠 FinteChile OS
│
├── 📊 Home / Dashboard Ejecutivo
│   ├── KPIs en tiempo real
│   ├── Tareas criticas (proximos 7 dias)
│   └── Proximos hitos
│
├── ⚙️ Operaciones
│   ├── Backlog General
│   ├── Vista Kanban por equipo
│   └── Incidencias / Bugs
│
├── 🎪 Eventos
│   ├── Chile Fintech Forum
│   ├── Fintechela (mensual)
│   ├── Fintech XP
│   ├── Women in Fintech
│   ├── Fintech Tour
│   └── Otros eventos
│
├── 🏢 Empresas (Asociados + Partners)
│   ├── DB Master de Empresas
│   ├── Vista: Pipeline de Prospeccion
│   ├── Vista: Miembros Activos
│   ├── Vista: Renovaciones pendientes
│   └── Vista: Empresas retiradas
│
├── 👥 Contactos / Personas
│   ├── DB de Contactos
│   └── Vista por empresa / por rol
│
├── 🤝 Sponsors / Partners Comerciales
│   ├── Pipeline de Sponsors (por evento)
│   └── Historial de sponsorships
│
├── 📣 Contenidos y Comunicaciones
│   ├── Calendario editorial
│   ├── RRSS tracker
│   ├── Newsletter / Fintech Weekly
│   └── PR / Prensa
│
├── 📁 Documentos y Playbooks
│   ├── Playbooks operativos
│   ├── Templates
│   └── Politicas internas
│
├── 🤖 Automatizaciones (Catalogo)
│   ├── Inventario de flujos n8n
│   ├── Estado / SLA / Owner
│   └── Log de incidencias
│
└── 🔧 Admin / MBC
    ├── Log de cambios
    ├── Credenciales (checklist)
    └── Notas de implementacion
```

---

## C.2 — Bases de Datos Maestras (Detalle)

### DB 1: Empresas (Master)
**Proposito:** Fuente de verdad de todos los miembros y prospectos de FinteChile.
**Reemplaza:** Hojas Prospeccion + Nuevas Empresas + Empresas + Salida del Sheets actual.

| Propiedad | Tipo | Ejemplo | Notas |
|-----------|------|---------|-------|
| Nombre Empresa | Title | "Global66" | Nombre comercial |
| RUT | Text | "76.XXX.XXX-K" | ID unico, validar formato |
| Razon Social | Text | "Global66 SpA" | Legal |
| Tipo Membresia | Select | Asociado / Partner | |
| Vertical | Select | Payments & Remittances, Financial & Digital Assets, Alternative Finance & Lending, Tech Infrastructure, Personal & Business Mgmt | Alineado con verticals oficiales |
| Tamano | Select | Pequena / Mediana / Grande | Segun ventas anuales en UF |
| Estado | Select | Prospecto → En Revision → Aprobado → Formalizando → Activo → No Renovara → Retirado | Ciclo de vida completo |
| Etapa Prospeccion | Select | Form 1 → Reunion → Form 2 → Revision → Directorio → Aprobado | Solo para prospectos |
| Ano Ingreso | Number | 2024 | |
| Mes Ingreso | Select | Enero...Diciembre | |
| Fecha Postulacion | Date | 2024-08-15 | |
| Valor Membresia (UF) | Number | 24 | Segun tabla de tarifas |
| Pais | Select | Chile / Otro | Extranjeros solo Partner |
| Sitio Web | URL | https://global66.com | |
| LinkedIn | URL | | |
| Descripcion | Text | "Plataforma de remesas..." | Breve |
| Giro | Text | "Servicios financieros" | |
| N Empleados | Number | 150 | |
| Ano Constitucion | Number | 2018 | |
| KAM Asignado | Person | @Diego | Key Account Manager |
| Contacto Principal | Relation → Contactos | | |
| Ultimo Seguimiento | Date | 2024-12-01 | |
| Proxima Accion | Text | "Enviar contrato" | |
| Motivo Interes | Text | "Networking + regulacion" | |
| Como Conocio FTC | Select | Referido / Evento / Web / RRSS / Otro | |
| Creado | Created time | Auto | |
| Modificado | Last edited time | Auto | |
| Creado por | Created by | Auto | |

**Relaciones:**
- → Contactos (1:N)
- → Renovaciones (1:N)
- → Sponsors (N:N via DB intermedia si aplica)

**Vistas recomendadas:**
1. **Pipeline Prospeccion** — Kanban por Etapa Prospeccion (filtro: Estado = Prospecto/En Revision)
2. **Miembros Activos** — Tabla con filtro Estado = Activo, agrupado por Vertical
3. **Renovaciones Pendientes** — Tabla con filtro de fecha de ultima renovacion > 10 meses
4. **Por KAM** — Board agrupado por KAM Asignado
5. **Retirados** — Archivo historico, filtro Estado = Retirado

---

### DB 2: Contactos (Personas)
**Proposito:** Registro de personas vinculadas a empresas miembro.
**Reemplaza:** Hoja Contactos del Sheets.

| Propiedad | Tipo | Ejemplo | Notas |
|-----------|------|---------|-------|
| Nombre Completo | Title | "Maria Lopez" | |
| Email | Email | maria@fintech.cl | ID funcional del contacto |
| Empresa | Relation → Empresas | Global66 | |
| Cargo | Text | "CFO" | |
| Tipo Contraparte | Multi-select | Principal / Marketing / Finanzas / Legal / Tecnico | |
| Telefono | Phone | +56 9 XXXX XXXX | |
| LinkedIn | URL | | |
| RUT Personal | Text | | Sensible — evaluar si es necesario |
| Nacionalidad | Select | Chilena / Otra | |
| Activo | Checkbox | true/false | Para soft-delete |
| Notas | Text | | |
| Creado | Created time | Auto | |

**Vistas:**
1. **Por Empresa** — Tabla agrupada por relacion Empresa
2. **Contrapartes Marketing** — Filtro tipo = Marketing
3. **Directorio Completo** — Lista alfabetica

---

### DB 3: Renovaciones (Pagos)
**Proposito:** Registro transaccional de cada pago/renovacion.
**Reemplaza:** Hoja Renovacion del Sheets.

| Propiedad | Tipo | Ejemplo | Notas |
|-----------|------|---------|-------|
| ID Renovacion | Title | "REN-2024-Global66" | Auto-generado |
| Empresa | Relation → Empresas | Global66 | |
| Ano Pago | Number | 2024 | |
| Mes Renovacion | Select | Marzo | |
| Valor Pagado (CLP) | Number | 960000 | |
| Tamano al Renovar | Select | Mediana | Puede cambiar |
| Estado Pago | Select | Al dia / Proximo a renovar / Atrasado / No renovara | |
| Fecha Vencimiento | Date | 2025-03-15 | |
| Seguimiento | Text | "Enviado recordatorio" | |
| Documento Cobro | Files | PDF adjunto | |
| Creado | Created time | Auto | |

**Vistas:**
1. **Renovaciones Vigentes** — Tabla filtrada por ano actual
2. **Atrasados** — Filtro Estado = Atrasado, ordenado por fecha
3. **Timeline Anual** — Calendar view por Fecha Vencimiento
4. **Resumen por Tamano** — Agrupado por Tamano al Renovar

---

### DB 4: Eventos
**Proposito:** Gestionar todos los eventos de FinteChile.

| Propiedad | Tipo | Ejemplo | Notas |
|-----------|------|---------|-------|
| Nombre Evento | Title | "Chile Fintech Forum 2025" | |
| Tipo | Select | Forum / Fintechela / Fintech XP / WIF / Tour / Otro | |
| Fecha Inicio | Date | 2025-09-15 | |
| Fecha Fin | Date | 2025-09-16 | |
| Ubicacion | Text | "Centro Parque, Santiago" | |
| Estado | Select | Planeacion / Confirmado / En ejecucion / Completado / Cancelado | |
| Owner | Person | @Joseph | |
| Asistentes Esperados | Number | 5000 | |
| Asistentes Reales | Number | | Post-evento |
| Presupuesto (CLP) | Number | | |
| Sponsors | Relation → Sponsors Pipeline | | |
| Tareas | Relation → Tareas | | |
| Notas | Text | | |
| Creado | Created time | Auto | |

**Vistas:**
1. **Calendario Anual** — Calendar
2. **Proximos Eventos** — Lista filtrada fecha > hoy
3. **Por Tipo** — Board agrupado por Tipo
4. **Forum Dashboard** — Filtro: Tipo = Forum (pagina dedicada)

---

### DB 5: Sponsors Pipeline
**Proposito:** Seguimiento del pipeline de sponsors por evento.

| Propiedad | Tipo | Ejemplo | Notas |
|-----------|------|---------|-------|
| Nombre | Title | "KPMG - Forum 2025" | Empresa + evento |
| Empresa | Relation → Empresas | KPMG | Puede ser Partner existente o nuevo |
| Evento | Relation → Eventos | Forum 2025 | |
| Contacto | Relation → Contactos | | |
| Tier | Select | Platinum / Gold / Silver / Bronze / Media | |
| Valor (CLP) | Number | 15000000 | |
| Estado | Select | Lead → Contactado → Propuesta → Negociacion → Cerrado Won → Cerrado Lost | |
| Probabilidad | Select | 25% / 50% / 75% / 100% | |
| Fecha Cierre Esperada | Date | 2025-06-01 | |
| Owner Comercial | Person | @Joseph | |
| Ultimo Contacto | Date | | |
| Proxima Accion | Text | "Enviar propuesta tier Gold" | |
| Contrato Firmado | Checkbox | | |
| Pago Recibido | Checkbox | | |
| Notas | Text | | |
| Creado | Created time | Auto | |

**Vistas:**
1. **Pipeline Kanban** — Board por Estado
2. **Por Evento** — Agrupado por relacion Evento
3. **Forecast** — Tabla con Valor * Probabilidad
4. **Cerrados** — Filtro Estado = Cerrado Won

---

### DB 6: Tareas / Operaciones
**Proposito:** Backlog operativo del equipo.

| Propiedad | Tipo | Ejemplo | Notas |
|-----------|------|---------|-------|
| Tarea | Title | "Preparar email onboarding Q1" | |
| Estado | Select | Backlog / To Do / En Progreso / En Revision / Hecho | |
| Prioridad | Select | Urgente / Alta / Media / Baja | |
| Area | Select | Operaciones / Eventos / Comms / Sinergias / Finanzas / Admin | |
| Asignado | Person | @Valeria | |
| Fecha Limite | Date | 2025-03-01 | |
| Evento Relacionado | Relation → Eventos | | Opcional |
| Empresa Relacionada | Relation → Empresas | | Opcional |
| Descripcion | Text | | |
| Creado | Created time | Auto | |
| Completado | Date | | Se llena al marcar Hecho |

**Vistas:**
1. **Mi Trabajo** — Filtro por persona actual, Estado != Hecho
2. **Kanban Equipo** — Board por Estado
3. **Por Area** — Agrupado por Area
4. **Vencidas** — Filtro Fecha Limite < hoy AND Estado != Hecho

---

### DB 7: Contenidos y Comunicaciones
**Proposito:** Calendario editorial y tracking de publicaciones.

| Propiedad | Tipo | Ejemplo | Notas |
|-----------|------|---------|-------|
| Titulo | Title | "Post LinkedIn: Nuevo asociado X" | |
| Canal | Multi-select | LinkedIn / Instagram / Newsletter / YouTube / Podcast / PR | |
| Estado | Select | Idea → Borrador → En Revision → Aprobado → Publicado | |
| Fecha Publicacion | Date | 2025-02-20 | |
| Responsable | Person | @Isidora | |
| Aprobador | Person | @Valeria | |
| Tipo Contenido | Select | Post / Articulo / Newsletter / Video / Podcast / Comunicado | |
| Empresa Mencionada | Relation → Empresas | | |
| Evento Relacionado | Relation → Eventos | | |
| Link Publicacion | URL | | Post-publicacion |
| Metricas (likes/views) | Number | | Post-publicacion |
| Assets | Files | Imagenes, videos | |
| Creado | Created time | Auto | |

**Vistas:**
1. **Calendario Editorial** — Calendar por Fecha Publicacion
2. **Pipeline Contenido** — Kanban por Estado
3. **Por Canal** — Board agrupado por Canal
4. **Esta Semana** — Filtro 7 dias

---

### DB 8: Catalogo de Automatizaciones
**Proposito:** Inventario vivo de todos los flujos n8n y su estado.

| Propiedad | Tipo | Ejemplo | Notas |
|-----------|------|---------|-------|
| Nombre Workflow | Title | "FTC-WF-001: Alta Asociado" | Naming estandar |
| Descripcion | Text | "Recibe form, crea registro, notifica" | |
| Estado | Select | Activo / Pausado / En desarrollo / Deprecado | |
| Criticidad | Select | Alta / Media / Baja | |
| Trigger | Select | Webhook / Schedule / Manual / DB change | |
| Sistemas | Multi-select | Notion / Gmail / Slack / Drive / HubSpot / Calendar | |
| Owner | Person | @Diego | Quien responde si falla |
| SLA Respuesta | Select | 1h / 4h / 24h / Best effort | |
| Ultima Ejecucion OK | Date | 2025-02-13 | Actualizado por n8n |
| Errores Recientes | Number | 0 | Actualizado por n8n |
| n8n Workflow ID | Text | "WF-abc123" | Referencia tecnica |
| Documentacion | URL | Link al runbook | |
| Creado | Created time | Auto | |

**Vistas:**
1. **Todos Activos** — Filtro Estado = Activo
2. **Por Criticidad** — Agrupado, Alta primero
3. **Salud del Sistema** — Ordenado por Errores Recientes desc

---

## C.3 — Convenciones

### Naming
- DBs: `[Categoria] Nombre` (ej. "Empresas Master", "Eventos FinteChile")
- Paginas: `[YYYY-MM-DD] Titulo` para documentos con fecha
- Workflows n8n: `FTC-WF-NNN_nombre-descriptivo` (ej. FTC-WF-001_alta-asociado)

### Estados estandar
- Prospectos: `Prospecto → En Revision → Aprobado → Formalizando → Activo → No Renovara → Retirado`
- Tareas: `Backlog → To Do → En Progreso → En Revision → Hecho`
- Contenidos: `Idea → Borrador → En Revision → Aprobado → Publicado`
- Sponsors: `Lead → Contactado → Propuesta → Negociacion → Cerrado Won → Cerrado Lost`

### Prioridades
- `Urgente` (rojo), `Alta` (naranja), `Media` (amarillo), `Baja` (gris)

### Timestamps
- `Creado` y `Modificado` en todas las DBs (automatico Notion)
- `Fecha Limite` donde aplique

---

## C.4 — Plan de Evolucion

### Semana 1 (MVP):
- Home basico con links
- DB Empresas migrada (datos activos del Sheets)
- DB Contactos migrada
- DB Tareas con vista Kanban
- Primer workflow n8n funcionando (alerta de prueba)

### Dia 30:
- DB Renovaciones migrada y funcional
- Pipeline Sponsors operativo
- DB Eventos con Forum 2025 cargado
- 3-5 automatizaciones activas
- Dashboard ejecutivo con KPIs basicos

### Dia 60:
- Calendario editorial integrado
- Catalogo de automatizaciones al dia
- Templates estandarizados (onboarding, propuesta sponsor, etc.)
- Reportes semanales automatizados
- Capacitacion del equipo completada

### Dia 90:
- Sistema estabilizado, todos los flujos documentados
- Metricas de uso y adopcion
- Primer review de arquitectura
- Handover pack v1 listo
- Transicion a modo mantencion

---

# D) CATALOGO DE AUTOMATIZACIONES n8n — Backlog Priorizado

## Top 10 Automatizaciones (por urgencia + impacto)

### WF-001: Alta de Nuevo Asociado/Partner
**Prioridad:** CRITICA
**Trigger:** Webhook desde formulario (HubSpot/Typeform/Tally)
**Descripcion:** Cuando un prospecto completa Form 1, se crea automaticamente un registro en Notion y se activan las tareas de seguimiento.

| Paso | Accion | Sistema |
|------|--------|---------|
| 1 | Recibir datos del formulario | n8n Webhook / HubSpot trigger |
| 2 | Validar datos (RUT formato, campos obligatorios) | n8n Code node |
| 3 | Verificar duplicados en DB Empresas | Notion API query |
| 4 | Crear registro en DB Empresas (Estado: Prospecto) | Notion API create |
| 5 | Crear contacto principal en DB Contactos | Notion API create |
| 6 | Crear tarea "Agendar reunion" asignada a KAM | Notion API create |
| 7 | Notificar en Slack #nuevos-prospectos | Slack API |
| 8 | Enviar email de confirmacion al prospecto | Gmail API |

**Outputs:** Registro creado, tarea asignada, notificacion enviada
**Errores y retries:** Retry x3 en falla de API; si duplicado, notificar en Slack y no crear
**Variables configurables:** Canal Slack, template email, KAM default
**Owner:** Guild Manager
**Criticidad:** Alta
**Test plan:** Enviar form de prueba con datos ficticios, verificar creacion en Notion, mensaje en Slack, email recibido

---

### WF-002: Pipeline de Sponsors — Seguimiento Automatizado
**Prioridad:** CRITICA (si Forum esta proximo)
**Trigger:** Cambio de estado en DB Sponsors Pipeline (Notion trigger)

| Paso | Accion | Sistema |
|------|--------|---------|
| 1 | Detectar cambio de estado en sponsor | Notion trigger (polling) |
| 2 | Si → "Contactado": crear tarea follow-up a 3 dias | Notion API |
| 3 | Si → "Propuesta": crear carpeta en Drive con naming estandar | Google Drive API |
| 4 | Si → "Negociacion": notificar a CEO en Slack | Slack API |
| 5 | Si → "Cerrado Won": email de bienvenida + crear tareas de onboarding | Gmail + Notion |
| 6 | Si → "Cerrado Lost": registrar motivo, archivar | Notion API |
| 7 | Cada 7 dias: recordatorio si no hay actividad en 7+ dias | n8n Schedule |

**Owner:** Head of Synergies
**Criticidad:** Alta
**Test plan:** Mover un sponsor de prueba por cada estado, verificar acciones

---

### WF-003: Recordatorio de Renovaciones
**Prioridad:** ALTA
**Trigger:** Schedule diario (09:00 CLT)

| Paso | Accion | Sistema |
|------|--------|---------|
| 1 | Consultar DB Renovaciones: vencimiento en 60/30/15/7 dias | Notion API query |
| 2 | Para cada empresa con renovacion proxima: enviar email al contacto principal | Gmail API |
| 3 | Crear/actualizar tarea de seguimiento asignada a KAM | Notion API |
| 4 | Si vencimiento < 7 dias y sin respuesta: alerta Slack a Guild Manager | Slack API |
| 5 | Si pasa fecha sin pago: cambiar estado a "Atrasado" | Notion API update |

**Owner:** Guild Manager
**Criticidad:** Alta
**Test plan:** Crear renovacion ficticia con vencimiento en 7 dias, verificar cadena completa

---

### WF-004: Chile Fintech Forum — Registro y Lead Capture
**Prioridad:** ALTA (dependiente de fecha del evento)
**Trigger:** Webhook desde plataforma de registro (Eventbrite/Welcu/Typeform)

| Paso | Accion | Sistema |
|------|--------|---------|
| 1 | Recibir datos de registro del asistente | Webhook |
| 2 | Crear/actualizar contacto en DB Contactos | Notion API |
| 3 | Si es de empresa asociada: marcar como "VIP" | Notion API |
| 4 | Segmentar por tipo (empresa, estudiante, gobierno, prensa) | n8n Code |
| 5 | Agregar a secuencia de emails pre-evento (3 emails) | Gmail/Mailchimp API |
| 6 | Crear dashboard de registros en tiempo real (counter en Notion) | Notion API |

**Owner:** Head of Synergies
**Criticidad:** Alta
**Test plan:** Simular 10 registros de diferentes tipos, verificar segmentacion

---

### WF-005: Reporte Semanal Ejecutivo (KPIs)
**Prioridad:** MEDIA-ALTA
**Trigger:** Schedule semanal (lunes 08:00)

| Paso | Accion | Sistema |
|------|--------|---------|
| 1 | Consultar metricas: total miembros activos, nuevos prospectos, renovaciones pendientes | Notion API |
| 2 | Consultar: sponsors en pipeline, valor total forecast | Notion API |
| 3 | Consultar: tareas vencidas, contenidos publicados | Notion API |
| 4 | Compilar resumen ejecutivo | n8n Code |
| 5 | Enviar a Slack #ejecutivo + email a CEO | Slack + Gmail |
| 6 | Registrar snapshot en DB de KPIs historicos | Notion API (opcional) |

**Owner:** MBC Operator (setup) → Guild Manager (ownership)
**Criticidad:** Media

---

### WF-006: Alerta de Tareas Vencidas
**Prioridad:** MEDIA
**Trigger:** Schedule diario (08:30)

| Paso | Accion | Sistema |
|------|--------|---------|
| 1 | Consultar DB Tareas: Fecha Limite < hoy AND Estado != Hecho | Notion API |
| 2 | Agrupar por Asignado | n8n Code |
| 3 | Enviar DM en Slack a cada persona con sus tareas vencidas | Slack API |
| 4 | Si tarea vencida > 3 dias: escalar a Guild Manager | Slack API |

**Owner:** Guild Manager
**Criticidad:** Media

---

### WF-007: Publicacion de Contenidos — Checklist y Aprobacion
**Prioridad:** MEDIA
**Trigger:** Cambio de estado en DB Contenidos

| Paso | Accion | Sistema |
|------|--------|---------|
| 1 | Si → "En Revision": notificar a Aprobador por Slack | Slack API |
| 2 | Si → "Aprobado": notificar a Responsable que puede publicar | Slack API |
| 3 | Si → "Publicado": solicitar link y metricas en 48h (recordatorio) | n8n Schedule |
| 4 | Viernes: compilar resumen semanal de contenidos publicados | Notion API + Slack |

**Owner:** Comms Manager
**Criticidad:** Media

---

### WF-008: Creacion Automatica de Carpeta en Drive
**Prioridad:** MEDIA
**Trigger:** Nuevo registro en DB Empresas con Estado = "Formalizando"

| Paso | Accion | Sistema |
|------|--------|---------|
| 1 | Detectar nuevo registro con estado Formalizando | Notion trigger |
| 2 | Crear carpeta en Drive: `/Miembros/[RUT]-[NombreEmpresa]/` | Google Drive API |
| 3 | Crear subcarpetas: Contrato, Pagos, Comunicaciones | Google Drive API |
| 4 | Actualizar registro en Notion con link a carpeta | Notion API |

**Owner:** Admin/Finanzas
**Criticidad:** Media

---

### WF-009: Onboarding Automatizado Post-Aprobacion
**Prioridad:** MEDIA
**Trigger:** Estado cambia a "Activo" en DB Empresas

| Paso | Accion | Sistema |
|------|--------|---------|
| 1 | Enviar email de bienvenida con informacion del gremio | Gmail API |
| 2 | Invitar contactos a comunidad digital (Slack/WhatsApp) | Slack API |
| 3 | Crear tareas de onboarding: presentacion, beneficios, calendario | Notion API |
| 4 | Notificar equipo en Slack #miembros | Slack API |
| 5 | Agregar a lista de newsletter | Mailchimp/SendGrid API |
| 6 | A los 30 dias: enviar encuesta de satisfaccion | Gmail API (scheduled) |

**Owner:** Guild Manager
**Criticidad:** Media

---

### WF-010: Health Check de Automatizaciones
**Prioridad:** BAJA (pero importante para mantenimiento)
**Trigger:** Schedule diario (07:00)

| Paso | Accion | Sistema |
|------|--------|---------|
| 1 | Consultar API de n8n: estado de cada workflow activo | n8n API |
| 2 | Verificar ultima ejecucion exitosa < 48h para workflows programados | n8n API |
| 3 | Si hay fallas: actualizar DB Automatizaciones en Notion | Notion API |
| 4 | Si hay 2+ fallas consecutivas: alerta a Slack #ops | Slack API |

**Owner:** MBC Operator
**Criticidad:** Baja

---

### Naming Estandar n8n
```
Formato: FTC-WF-NNN_nombre-descriptivo
Ejemplos:
  FTC-WF-001_alta-asociado
  FTC-WF-002_pipeline-sponsor
  FTC-WF-003_recordatorio-renovacion
  FTC-WF-004_forum-registro
  FTC-WF-005_reporte-semanal
  FTC-WF-006_alerta-tareas-vencidas
  FTC-WF-007_contenidos-aprobacion
  FTC-WF-008_drive-carpeta-auto
  FTC-WF-009_onboarding-miembro
  FTC-WF-010_health-check

Folders en n8n:
  /Core (WF-001 a 003)
  /Eventos (WF-004 y relacionados)
  /Comunicaciones (WF-005, 007)
  /Operaciones (WF-006, 008, 009)
  /Sistema (WF-010)
```

---

# E) ENTREGABLES PROFESIONALES

## E.1 — Roadmap 30/60/90 Dias

### SEMANA 1: Fundacion
- [ ] Confirmar respuestas a preguntas criticas (Bloque A)
- [ ] Crear workspace Notion bajo cuenta FinteChile
- [ ] Crear cuenta n8n Cloud bajo email FinteChile
- [ ] Configurar permisos RBAC iniciales
- [ ] Migrar DB Empresas (datos activos) desde Sheets
- [ ] Migrar DB Contactos desde Sheets
- [ ] Setup DB Tareas (Kanban basico)
- [ ] Primer workflow de prueba (n8n → Notion → Slack)
- [ ] Home page basico del workspace
- **Hito:** Equipo puede ver datos en Notion y recibir primera notificacion

### SEMANAS 2-4: Operacion Base
- [ ] Migrar DB Renovaciones
- [ ] Setup DB Sponsors Pipeline
- [ ] Setup DB Eventos (cargar Forum 2025 + Fintechelas)
- [ ] Implementar WF-001 (Alta Asociado)
- [ ] Implementar WF-003 (Recordatorio Renovaciones)
- [ ] Implementar WF-006 (Alerta Tareas Vencidas)
- [ ] Dashboard ejecutivo v1 (KPIs basicos)
- [ ] Capacitacion equipo: navegacion basica Notion
- **Hito:** Sistema operativo basico, 3 automatizaciones activas

### MES 2-3: Consolidacion
- [ ] Implementar WF-002 (Pipeline Sponsors)
- [ ] Implementar WF-004 (Forum Registro — si aplica timeline)
- [ ] Implementar WF-005 (Reporte Semanal)
- [ ] Setup DB Contenidos y calendario editorial
- [ ] Implementar WF-007, WF-008, WF-009
- [ ] Implementar WF-010 (Health Check)
- [ ] Templates y playbooks operativos
- [ ] Capacitacion avanzada: edicion, automatizaciones, troubleshooting
- [ ] Review de arquitectura con equipo
- [ ] Handover pack v1 completo
- **Hito:** 10 automatizaciones activas, equipo autonomo, documentacion completa

### MES 4-10: Mantencion
- Soporte mensual segun SLA
- Ajustes y nuevas automatizaciones segun demanda
- Review trimestral de sistema
- Actualizacion de documentacion

---

## E.2 — Matriz RACI

| Actividad | FinteChile CEO | Guild Manager | MBC Operator | Equipo FTC |
|-----------|:-:|:-:|:-:|:-:|
| Aprobacion arquitectura | **A** | C | **R** | I |
| Creacion cuentas (Notion, n8n) | **A/R** | C | I | I |
| Migracion de datos | A | **C** | **R** | I |
| Validacion datos migrados | A | **R** | C | **C** |
| Diseno de workflows n8n | I | **C** | **R** | I |
| Configuracion permisos | **A** | C | **R** | I |
| Capacitacion equipo | I | **C** | **R** | **R** |
| Operacion diaria Notion | I | **R** | C | **R** |
| Monitoreo automatizaciones | I | **A** | **R** | I |
| Documentacion/Runbooks | I | C | **R** | I |
| Handover | **A** | **R** | **R** | I |

*R = Responsable, A = Aprobador, C = Consultado, I = Informado*

---

## E.3 — Plan de Mantencion Mensual (USD 200/mes x 10 meses)

### Incluye:
- Monitoreo de automatizaciones (verificar health, corregir fallas)
- Hasta 5 horas de ajustes/mejoras por mes
- Soporte por canal acordado (Slack/email), respuesta < 24h laborales
- 1 automatizacion nueva simple por mes (o equivalente en mejoras)
- Reporte mensual: estado del sistema, metricas, recomendaciones
- Backup mensual de workflows y configs

### No incluye:
- Rediseno completo de la arquitectura
- Migraciones masivas adicionales
- Desarrollo de integraciones complejas (APIs custom, middleware)
- Soporte fuera de horario laboral o fines de semana
- Capacitacion a nuevos integrantes (cotizable aparte)
- Licencias de herramientas (Notion, n8n, etc.)

### SLA:
- Falla critica (workflow principal caido): respuesta < 4h laborales
- Ajuste operativo: respuesta < 24h laborales
- Mejora/nueva funcionalidad: planificado en sprint mensual

---

## E.4 — Plan de Salida (Handover Pack)

### Checklist de Handover

```
HANDOVER PACK — MetaBuild Smart → FinteChile
==============================================

[ ] 1. DOCUMENTACION
    [ ] Documento de arquitectura actualizado (PDF)
    [ ] Diagramas de flujo por cada automatizacion
    [ ] Runbooks operativos por proceso critico
    [ ] FAQ / Troubleshooting guide

[ ] 2. NOTION WORKSPACE
    [ ] Export completo (Markdown + CSV)
    [ ] Schema documentado por cada DB
    [ ] Templates listados y documentados
    [ ] Permisos revisados (remover MBC Operator)

[ ] 3. n8n WORKFLOWS
    [ ] Export JSON de todos los workflows
    [ ] Documentacion inline en cada nodo
    [ ] Lista de credenciales (sin secretos, solo inventario)
    [ ] Plan de rotacion de tokens

[ ] 4. ACCESOS Y SEGURIDAD
    [ ] Revocar accesos MBC a Notion
    [ ] Revocar accesos MBC a n8n
    [ ] Verificar que todas las credenciales estan bajo cuentas FTC
    [ ] Cambiar passwords si hubo acceso compartido

[ ] 5. TRANSFERENCIA DE CONOCIMIENTO
    [ ] Sesion de walkthrough grabada (1-2h)
    [ ] Designar nuevo responsable de automatizaciones en FTC
    [ ] 30 dias de soporte post-handover por email

[ ] 6. ARCHIVOS Y BACKUPS
    [ ] Ultimo backup completo en Drive de FTC
    [ ] Historial de cambios y decisiones
    [ ] Carpeta /contracts con acuerdos vigentes
```

---

# F) MODO DE TRABAJO (Claude Code + Tu)

## Proceso Operativo

1. **Fase actual (completada):** Revision de documentos + Master Plan
2. **Siguiente paso:** Enviar preguntas criticas a FinteChile, confirmar supuestos
3. **Con accesos:** Implementacion guiada paso a paso (Notion → n8n → testing)
4. **En operacion:** Monitoreo, ajustes, documentacion continua

## Checklist de Validaciones Pendientes

- [ ] Confirmar respuestas del Bloque A (preguntas 1-15)
- [ ] Validar supuestos S1-S10
- [ ] DECISION REQUERIDA: Politica de datos personales / consentimiento migracion
- [ ] DECISION REQUERIDA: Plan Notion (Free vs Business) — impacta RBAC y audit log
- [ ] DECISION REQUERIDA: n8n Cloud vs Self-hosted
- [ ] DECISION REQUERIDA: ¿Mantener HubSpot o reemplazar con Notion como CRM?
- [ ] Obtener accesos: Google Sheets (Master), Notion workspace, n8n, Slack

---

*Documento generado por Meta Build City para proyecto MetaBuild Smart — FinteChile.*
*Todos los sistemas y cuentas son propiedad de FinteChile. MBC opera con permisos delegados.*
