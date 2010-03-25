# Source files
PODFILES=resume.pod

# Binaries
POD2HTML=pod2html

# Generated files
HTMLFILES=$(PODFILES:.pod=.html)

# Temporary files
PODTMPFILES=pod2htmd.tmp pod2htmi.tmp

.INTERMEDIATE: $(PODTMPFILES)
.PHONY: all clean

all: $(HTMLFILES)

clean:
	$(RM) $(HTMLFILES)

$(PODTMPFILES):

%.html: %.pod $(PODTMPFILES)
	$(POD2HTML) --infile=$< --outfile=$@
