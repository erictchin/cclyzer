# For debugging
QUIET       := @


# Unix tools
INSTALL     := install
MKDIR       := mkdir -p
SED         := sed
RM          := rm -f
MV          := mv
M4          := m4
CXX         := g++
PROTOC      := /usr/bin/protoc

# Other tools
factgen.exe   := fact-generator
importgen.exe := import-generator


#--------------------
# Directory Tree
#--------------------

OUTDIR       = $(LEVEL)/build
DESTDIR     ?= /usr/local

INSTALL_BIN  = $(DESTDIR)/bin
INSTALL_LIB  = $(DESTDIR)/lib


#---------------------------------------------------
# Template to create destination directory
#
# Usage:
#   $(eval $(call create-destdir, module-name))
#---------------------------------------------------

define create-destdir
$1.outdir    = $(OUTDIR)/$(or $2,$(notdir $(CURDIR)))
$1.artifact :=

$$($1.outdir): | $(OUTDIR)
	$(MKDIR) $$@

endef


# Create build root-directory

$(OUTDIR):
	$(MKDIR) $@