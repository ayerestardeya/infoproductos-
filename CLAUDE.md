# INFOPRODUCTOS ETP — Contexto del Proyecto

## Quién soy
Nicolás, estudiante de Ingeniería en Negocios (Chile), cofundador de ETP 
(agencia de marketing digital con IA). Este proyecto es la vertical de 
infoproductos — productos digitales (cursos, guías, plantillas, 
comunidades) que empaquetan el conocimiento que ya genero operando ETP 
y sus SaaS verticales (KUTT, LA CONE, BUKI, CUTTI).

## Restricción de tiempo
4-6 horas/semana para esta vertical. La prioridad absoluta de horas 
sigue siendo ETP + LA CONE. Nada de este proyecto compite por esas horas.

## AISLAMIENTO DE PROYECTO (crítico)
Este proyecto es completamente independiente del repo de KUTT 
(kutt-ops-mvp) y de cualquier otro código de ETP. Reglas duras:
1. NUNCA leas, modifiques, o hagas referencia a archivos fuera de esta 
   carpeta (infoproductos-etp/) salvo que yo te dé la ruta exacta y te 
   lo pida explícitamente. No "explores" el sistema de archivos por tu 
   cuenta buscando contexto adicional.
2. Google Drive, n8n y Supabase son cuentas COMPARTIDAS con el resto de 
   ETP. Está bien que leas documentos de la carpeta MARKETING Y 
   CONTENIDO en Drive cuando te lo pida. Pero NUNCA escribas, 
   modifiques, o borres nada en Supabase o n8n desde este proyecto sin 
   confirmación explícita — podrías tocar sin querer datos de 
   producción de otro SaaS que vive en la misma cuenta.
3. Antes de cualquier operación de escritura fuera de esta carpeta 
   (Drive, Supabase, n8n, o cualquier API externa), dime exactamente 
   qué vas a escribir y dónde, y espera mi confirmación.
4. Cuando instalemos skills, instálalas SIEMPRE en .claude/skills/ 
   dentro de esta carpeta, NUNCA en ~/.claude/skills/ (eso es global y 
   aplicaría a todos mis proyectos, incluyendo KUTT). Única excepción: 
   si una skill es genuinamente útil para todo lo que hago y yo apruebo 
   explícitamente instalarla global.

## Estrategia de modelos (sándwich)
- Fable 5 / Opus: solo para decisiones de arquitectura, resolver 
  tensiones entre fuentes, o revisión final de calidad.
- Sonnet 5: ejecución rutinaria, redacción de contenido, iteración.
- Haiku 4.5: tareas de alto volumen y bajo razonamiento (scoring, 
  clasificación, extracción de datos).
No uses un modelo caro para trabajo que uno barato resuelve igual.

## Regla de tokens
Cuando la skill Caveman esté instalada, úsala por defecto en respuestas 
conversacionales. Respuestas completas solo cuando el output es un 
entregable final (documento, copy de venta, contenido publicable).

## Conexiones
- Google Drive: carpeta MARKETING Y CONTENIDO contiene el Roadmap 
  Maestro v1, verticales documentadas, y el Índice Maestro.
- n8n: orquestación de automatizaciones (compartido con ETP).
- Supabase: base de datos (compartido con ETP).

## Reglas de comportamiento
- Pregunta antes de asumir. Si algo depende de mi contexto y no está 
  escrito aquí, pregúntame — no adivines.
- No inventes skills que no existan. Si mencionas una, tiene que ser 
  real y verificable.
- Ningún paso irreversible sin confirmación explícita.
- Todo secreto vive en .env, nunca en código ni en CLAUDE.md.
- Cuando yo te corrija o vayas aprendiendo algo nuevo, actualiza 
  memory.md.

## Estado actual del infoproducto
INDEFINIDO. El producto insignia no está decidido todavía — puede ser 
un "Pack Tienda Express con IA" (plantillas/workflows), un curso, una 
comunidad de pago, o algo distinto. La definición es la próxima tarea 
real después de instalar las skills.

## Skills instaladas
Instaladas manualmente (copia local, no vía plugin marketplace) en 
`.claude/skills/`, ninguna en `~/.claude/skills/` global:
- `caveman` — ahorro de tokens en output conversacional
- `factory-floor` — coaching de producto/negocio (Theory of Constraints)
- `doc-coauthoring` — revisión adversarial de documentos (oficial Anthropic)
- `blog` + 29 sub-skills `blog-*` — motor de contenido y calendario editorial 
  (suite claude-blog de AgriciDaniel)
- `seo-orchestrator` + sub-skills `seo-*`, `audit`, `fix`, `geo`, `score` — 
  auditoría SEO clásico + GEO/AEO (suite claude-seo-ai de Hainrixz; 
  DISTINTA de claude-seo de AgriciDaniel, esa no se instaló)
- `emails` — secuencias de email para gente que ya mostró interés 
  (nombre real de la skill en el bundle de Corey Haines; NO se llama 
  "email-sequence", corregido tras verificar la fuente)
- `cold-email` — outreach en frío B2B (mismo bundle, instalada en 
  paralelo a `emails` para comparar cuál se usa más)
- `theme-factory` — consistencia visual (oficial Anthropic)

Agentes de soporte de las suites blog y seo-ai en `.claude/agents/`.
Entorno virtual Python local en `.venv/` (nunca pip global) con las 
dependencias core de claude-blog (textstat, beautifulsoup4).

## Medición de tokens
- Nicolás usa plan de suscripción (Pro/Max), no API key — el comando 
  relevante es `/usage`, no `/cost`.
- Correr `/usage` ANTES y DESPUÉS de cualquier tarea grande — así se 
  puede comparar el costo de definición vs. redacción vs. revisión.
- `/status` muestra cuánto queda del límite del plan actual.
- Dashboard local `claude-usage` (phuryn) instalado en `tools/claude-usage/`. 
  Correrlo SIEMPRE vía `tools/claude-usage/run.sh [scan|today|week|stats|dashboard]` 
  (nunca `python cli.py` directo) — el wrapper fuerza que su base de 
  datos quede en `tools/claude-usage/usage.db` dentro del proyecto, en 
  vez del default `~/.claude/usage.db` (global). Lee logs de uso desde 
  `~/.claude/projects/` (eso sí es lectura de infraestructura compartida 
  de Claude Code, no un dato de otro proyecto — no escribe ahí).
