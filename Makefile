# Source files
TEXFILES := resume.tex

# Binaries
LATEX := xelatex
DETEX := detex

# Generated files
PDFFILES := $(TEXFILES:.tex=.pdf)
TXTFILES := $(TEXFILES:.tex=.txt)

.INTERMEDIATE: $(TEXFILES:.tex=.log)
.PHONY: all clean pdf

all: pdf txt
pdf: $(PDFFILES)
txt: $(TXTFILES)

clean:
	$(RM) $(PDFFILES) $(TXTFILES)

%.pdf %.log: %.tex
	$(LATEX) $<

%.txt: %.tex
	$(DETEX) $< > $@
