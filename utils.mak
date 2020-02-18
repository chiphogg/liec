# Utility functions common to all Makefiles.

# Get the source filename corresponding to a stem.
sourcefile = $(patsubst %,%.sml,$(1))

# Get the latex target filename corresponding to a stem.
latexfile = $(patsubst %,%.latex,$(1))

# Get all elements after the first.
tail = $(wordlist 2,$(words $1),$1)

# Check if a word is the first word in a list.
is_first_word = $(if $(filter $1,$(firstword $2)),Y,)

# Get the index of the first occurrence of a token.
_pos_if_nonempty = $(if $(call is_first_word,$1,$2),$(words $3),$(call \
		   pos,$1,$(call tail,$2),$3))
pos = $(if $2,$(call _pos_if_nonempty,$1,$2,x $3),0)

# A sequence of indices corresponding to a list.
indices = $(if $1,$(words x $2) $(call indices,$(call tail,$1),x $2),)

# HTML filenames, according to the existing convention (i.e., index-based).
htmlfile = $(patsubst %,$1%.html,$(call indices,$2))

# The HTML template filenames with stems in $(1) for index $(2).
html_templates = $(patsubst %,%$(2).html,$(1))
