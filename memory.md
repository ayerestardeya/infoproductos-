# Memoria del proyecto

## 2026-07-14 — Instalación de skills
Se instalaron 8 skills (copia manual local a `.claude/skills/`, sin 
plugin marketplace ni instaladores globales, para respetar el 
aislamiento del proyecto): caveman, factory-floor, doc-coauthoring, 
blog (claude-blog, 30 sub-skills), seo-orchestrator (claude-seo-ai, ~28 
sub-skills), emails, cold-email, theme-factory.

Corrección de nombre: la skill de secuencias de email del bundle de 
Corey Haines se llama `emails` en la fuente real, no "email-sequence" 
como se había escrito originalmente. Se instaló y documentó con su 
nombre correcto.

`emails` y `cold-email` instaladas en paralelo para comparar cuál se 
usa más en la práctica — revisar en 2-3 semanas cuál desinstalar si una 
no se usa.

Se creó `.venv/` local (Python) con textstat y beautifulsoup4 para las 
partes de claude-blog que las necesitan. claude-seo-ai no requirió 
entorno Python (sus scripts son Node.js sin dependencias).

Se instaló el dashboard `claude-usage` (phuryn) en `tools/claude-usage/` 
para medir tokens/costo. Aprendizaje: por defecto esa herramienta 
escribe su base de datos en `~/.claude/usage.db` (global, fuera del 
proyecto) — se creó sin querer una vez al probarla. Se borró con 
confirmación explícita y se creó `tools/claude-usage/run.sh`, que fuerza 
`CLAUDE_USAGE_DB` a una ruta dentro del proyecto. Usar siempre ese 
wrapper, nunca `python cli.py` directo, para no romper el aislamiento.
