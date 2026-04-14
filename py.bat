python - <<'PY'
from pathlib import Path

files = [
    "REVIEW/review__stack_sql_basics.md",
    "REVIEW/review__stack_schema_basics.md",
    "REVIEW/review__stack_join_core.md",
    "REVIEW/review__stack_group_agg.md",
]

for p in map(Path, files):
    if not p.exists():
        print("skip (missing):", p)
        continue
    s = p.read_text(encoding="utf-8")
    try:
        fixed = s.encode("cp1252").decode("utf-8")
    except UnicodeEncodeError:
        # 如果混进了真正的中文，cp1252 编不回去，就别硬转
        print("skip (not pure mojibake):", p)
        continue
    p.write_text(fixed, encoding="utf-8")
    print("fixed:", p)
PY
