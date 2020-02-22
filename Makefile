# Master Makefile for managing the "Lessons In Electric Circuits" textbooks.

# Make HTML versions of every textbook.
#
# This rule should stay at the top of this Makefile so as to be the default
# option.
html : output_folders
	make -C DC html
	make -C AC html
	make -C Semi html
	make -C Digital html
	make -C Ref html
	make -C Exper html
	ln -rsf index.htm output/

# Make PDF versions of every textbook.
pdf : output_folders
	make -C DC output/DC.pdf
	make -C AC output/AC.pdf
	make -C Semi output/SEMI.pdf
	make -C Digital output/DIGI.pdf
	make -C Ref output/REF.pdf
	make -C Exper output/EXP.pdf

# Make everything.
all: html pdf

.PHONY: all html pdf

#####################################################################

FOLDERS := DC AC Semi Digital Ref Exper

output_folders: $(patsubst %,output/%,$(FOLDERS))

output/%: FORCE
	./prepare_output.sh "$*"

FORCE:
