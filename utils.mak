# Utility functions common to all Makefiles.

# Get the source filename corresponding to a stem.
sourcefile = $(patsubst %,%.sml,$(1))

# Get the latex target filename corresponding to a stem.
latexoutput = $(patsubst %,output/%.latex,$(1))

# A sequence of indices corresponding to a list.
indices = $(if $1,$(words x $2) $(call indices,$(call tail,$1),x $2),)

# HTML filenames, according to the existing convention (i.e., index-based).
htmloutput = $(patsubst %,output/$1%.html,$(call indices,$2))

# The HTML template filenames with stems in $(1) for index $(2).
html_templates = $(patsubst %,templates/%$(2).html,$(1))

# The LaTeX template filenames with stems in $(1).
latex_templates = $(patsubst %,templates/%.latex,$(1))
