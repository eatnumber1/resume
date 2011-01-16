# Source files
PODFILES := resume.pod
TEXFILES := resume.tex

# Binaries
POD2HTML := pod2html
LATEX := xelatex
POD2LATEX := pod2latex
DETEX := detex

# Generated files
HTMLFILES := $(PODFILES:.pod=.html)
PDFFILES := $(TEXFILES:.tex=.pdf)
TXTFILES := $(TEXFILES:.tex=.txt)

# Temporary files
PODTMPFILES=pod2htmd.tmp pod2htmi.tmp

.INTERMEDIATE: $(PODTMPFILES) $(TEXFILES:.tex=.log)
.PHONY: all clean html pdf

all: html pdf txt
html: $(HTMLFILES)
pdf: $(PDFFILES)
txt: $(TXTFILES)

clean:
	$(RM) $(HTMLFILES) $(PDFFILES) $(TXTFILES)

$(PODTMPFILES):

%.html: %.pod $(PODTMPFILES)
	$(POD2HTML) --infile=$< --outfile=$@

%.pdf %.log: %.tex
	$(LATEX) $<

%.txt: %.tex
	$(DETEX) $< > $@
