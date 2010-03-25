# Source files
PODFILES=resume.pod

# Binaries
POD2HTML=pod2html
POD2TEXT=pod2text

# Generated files
HTMLFILES=$(PODFILES:.pod=.html)
TXTFILES=$(PODFILES:.pod=.txt)

# Temporary files
PODTMPFILES=pod2htmd.tmp pod2htmi.tmp

.INTERMEDIATE: $(PODTMPFILES)
.PHONY: all clean html txt

all: html txt

html: $(HTMLFILES)

txt: $(TXTFILES)

clean:
	$(RM) $(HTMLFILES) $(TXTFILES)

$(PODTMPFILES):

$(HTMLFILES): %.html: %.pod $(PODTMPFILES)
	$(POD2HTML) --infile=$< --outfile=$@

$(TXTFILES): %.txt: %.pod
	$(POD2TEXT) $< $@
