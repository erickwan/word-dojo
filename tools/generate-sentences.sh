#!/bin/bash
# One-time batch: generate an example sentence per word, write it to a static file.
# Re-run only when new words are added to a sheet.
cd /tmp/sent
KEY="sb_publishable_grIeEoGO_hvTpDm0dI6bsw_OD4tS041"
URL="https://ywoaeadxfettakxehsel.supabase.co/functions/v1/generate-questions"
who="$1"; src="$2"; name="$3"; age="$4"
: > "${who}_out.jsonl"
total=$(python3 -c "import json;print(len(json.load(open('$src'))))")
i=0
while [ $i -lt $total ]; do
  python3 - "$src" "$i" "$name" "$age" > req.json <<'PY'
import json,sys
words=json.load(open(sys.argv[1])); i=int(sys.argv[2])
chunk=words[i:i+12]
print(json.dumps({"mode":"sentences",
  "profile":{"name":sys.argv[3],"age":sys.argv[4],"band":"upper-elementary","goal":"vocabulary"},
  "words":chunk}))
PY
  curl -s -X POST "$URL" -H "apikey: $KEY" -H "Authorization: Bearer $KEY" \
       -H "Content-Type: application/json" --max-time 180 -d @req.json >> "${who}_out.jsonl"
  echo "" >> "${who}_out.jsonl"
  echo "  $who: $((i+12>total?total:i+12))/$total" >&2
  i=$((i+12))
done
