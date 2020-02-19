# Master Makefile for managing the "Lessons In Electric Circuits" textbooks.

#####################################################################

html :
	make -C DC html
	make -C AC html
	make -C Semi html
	make -C Digital html
	make -C Ref html
	make -C Exper html

# The 'html' option puts together all the pieces necessary to create
# HTML output for each volume of the book.  It should stay at the 
# top of this Makefile so as to be the default option.

#####################################################################

all :
	make html
	make -C DC output/DC.pdf
	make -C AC output/AC.pdf
	make -C Semi output/SEMI.pdf
	make -C Digital output/DIGI.pdf
	make -C Ref output/REF.pdf
	make -C Exper output/EXP.pdf

# The 'all' option generates HTML and compressed PostScript output 
# for all volumes, and also updates all archive files.  The intent 
# this option is for web content providers to be able to simply 
# type 'make all' after uploading the latest source code and have 
# it produce ALL the files necessary for users to download.

#####################################################################

FOLDERS := DC AC Semi Digital Ref Exper

output_folders: $(patsubst %,output/%,$(FOLDERS))

output/%: FORCE
	./prepare_output.sh "$*"

FORCE:

link_targets := $(patsubst %,link/%,$(FOLDERS))

link: $(link_targets)

link/%: output/%
	make -C "$*" link

#####################################################################

png : 
	make -C DC png
	make -C AC png
	make -C Semi png
	make -C Digital png
	make -C Ref png
	make -C Exper png

# The 'png' option creates PNG versions of all illustrations, 
# graphs, and equations from their respective EPS source files.
