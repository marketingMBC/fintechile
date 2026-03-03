#!/bin/bash
# MetaBuild Smart - Notion Page Builder
# Creates all subpages under Master V4

TOKEN="${NOTION_TOKEN:?Set NOTION_TOKEN env variable}"
NOTION_VERSION="2022-06-28"
PARENT_PAGE="2baa6b94-34ae-808e-959b-fcb7bc037447"

create_page() {
  local title="$1"
  local icon="$2"
  local parent="$3"

  local result=$(curl -s "https://api.notion.com/v1/pages" \
    -H "Authorization: Bearer $TOKEN" \
    -H "Notion-Version: $NOTION_VERSION" \
    -H "Content-Type: application/json" \
    -d "{
      \"parent\": {\"page_id\": \"$parent\"},
      \"icon\": {\"type\": \"emoji\", \"emoji\": \"$icon\"},
      \"properties\": {
        \"title\": [{\"text\": {\"content\": \"$title\"}}]
      }
    }")

  echo "$result" | python3 -c "import sys,json; print(json.load(sys.stdin).get('id','ERROR'))" 2>/dev/null
}

append_blocks() {
  local page_id="$1"
  local blocks_json="$2"

  curl -s -X PATCH "https://api.notion.com/v1/blocks/$page_id/children" \
    -H "Authorization: Bearer $TOKEN" \
    -H "Notion-Version: $NOTION_VERSION" \
    -H "Content-Type: application/json" \
    -d "$blocks_json" > /dev/null 2>&1
}

echo "=== Creating Master Plan Structure in Notion ==="
echo ""

# Create main section pages
echo "Creating main pages..."
PAGE_NARRATIVA=$(create_page "Master Plan - Resumen Ejecutivo" "📋" "$PARENT_PAGE")
echo "  Narrativa: $PAGE_NARRATIVA"

PAGE_DISCOVERY=$(create_page "A. Descubrimiento - Preguntas Criticas" "🔍" "$PARENT_PAGE")
echo "  Discovery: $PAGE_DISCOVERY"

PAGE_ARCH=$(create_page "B. Arquitectura y Ownership" "🏗️" "$PARENT_PAGE")
echo "  Arquitectura: $PAGE_ARCH"

PAGE_NOTION=$(create_page "C. Notion OS v4 - Diseno del Workspace" "💻" "$PARENT_PAGE")
echo "  Notion OS: $PAGE_NOTION"

PAGE_N8N=$(create_page "D. Automatizaciones n8n - Backlog" "🤖" "$PARENT_PAGE")
echo "  n8n: $PAGE_N8N"

PAGE_ROADMAP=$(create_page "E. Roadmap 30-60-90 y Entregables" "🗺️" "$PARENT_PAGE")
echo "  Roadmap: $PAGE_ROADMAP"

PAGE_HANDOVER=$(create_page "F. Plan de Salida y Handover" "📦" "$PARENT_PAGE")
echo "  Handover: $PAGE_HANDOVER"

echo ""
echo "All pages created. IDs:"
echo "NARRATIVA=$PAGE_NARRATIVA"
echo "DISCOVERY=$PAGE_DISCOVERY"
echo "ARCH=$PAGE_ARCH"
echo "NOTION=$PAGE_NOTION"
echo "N8N=$PAGE_N8N"
echo "ROADMAP=$PAGE_ROADMAP"
echo "HANDOVER=$PAGE_HANDOVER"
