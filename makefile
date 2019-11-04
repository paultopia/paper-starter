all: push

push: copy
	git add .
	git commit -m "compile a draft"
	git push

copy: build
	cp current-draft.pdf ~/Dropbox/02\ Research/present/{{ CANONICAL_NAME }}/current-draft.pdf
	cp current-draft.docx ~/Dropbox/02\ Research/present/{{ CANONICAL_NAME }}/current-draft.docx
	cp current-draft.md ~/Dropbox/02\ Research/present/{{ CANONICAL_NAME }}/current-draft.md
	cp investors-rol.json ~/Dropbox/02\ Research/present/{{ CANONICAL_NAME }}/investors-rol.json

build: updatedate
	pandoc -o current-draft.pdf -s --pdf-engine=xelatex --filter pandoc-citeproc current-draft.md
	pandoc -o current-draft.docx -s --filter pandoc-citeproc current-draft.md

updatedate:
	python update-date.py
