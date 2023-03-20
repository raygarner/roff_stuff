# NOTE: use pdftk to manually move contents page

TITLE=doc

all: $(TITLE).ms
	refer -e -S -sA -p ~/docs/roff/bib $(TITLE).ms | groff -e -t -p -ms > $(TITLE).ps
	ps2pdf $(TITLE).ps $(TITLE).pdf

wc: $(TITLE).ms
	refer -p ~/docs/roff/bib $(TITLE).ms | groff -e -t -p -ms -a | \
		sed -e '/^</d' | wc -w

clean:
	rm -f *.ps *.pdf
