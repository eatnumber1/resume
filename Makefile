# Source files
TEXFILES=resume.tex

# Binaries
PDFLATEX=pdflatex

# Generated files
PDFFILES=$(TEXFILES:.tex=.pdf)

.INTERMEDIATE: $(TEXFILES:.tex=.log)
.PHONY: all clean

all: $(PDFFILES)

clean:
	$(RM) $(PDFFILES)

%.pdf %.log: %.tex
	$(PDFLATEX) $<
