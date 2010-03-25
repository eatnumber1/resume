# Source files
PODFILES=resume.pod
TEXFILES=resume.tex

# Binaries
POD2HTML=pod2html
PDFLATEX=pdflatex
POD2LATEX=pod2latex

# Generated files
HTMLFILES=$(PODFILES:.pod=.html)
PDFFILES=$(TEXFILES:.tex=.pdf)

# Temporary files
PODTMPFILES=pod2htmd.tmp pod2htmi.tmp

.INTERMEDIATE: $(PODTMPFILES) $(TEXFILES:.tex=.log)
.PHONY: all clean html pdf

all: html pdf

html: $(HTMLFILES)

pdf: $(PDFFILES)

clean:
	$(RM) $(HTMLFILES) $(PDFFILES)

$(PODTMPFILES):

%.html: %.pod $(PODTMPFILES)
	$(POD2HTML) --infile=$< --outfile=$@

%.pdf %.log: %.tex
	$(PDFLATEX) $<
