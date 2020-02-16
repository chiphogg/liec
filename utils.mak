# Utility functions common to all Makefiles.

# Get the source filename corresponding to a stem.
sourcefile = $(patsubst %,%.sml,$(1))

# Get the latex target filename corresponding to a stem.
latexfile = $(patsubst %,%.latex,$(1))
