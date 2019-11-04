from datetime import datetime
import re

def today():
    now = str(datetime.now().strftime("%B %-d, %Y"))
    return "date: " + now + "\n"

with open("current-draft.md") as fm:
    frontmatter = fm.read()

frontmatter = re.sub(r'date:\s.*\n', today(), frontmatter)

with open("current-draft.md", 'w') as fm:
    fm.write(frontmatter)

