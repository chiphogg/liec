# Makefile for managing "Lessons In Electric Circuits -- Experiments"
# modified  01/7/2006 (DC) -Added mini-TOC  to each chapter of html, .latex
# modified 09/22/2007 (DC) - eps: target modified for smaller better looking (pdf) files
# modified 10/03/2008 (DC) -Added sml2latx.sed, sml2html.sed to Latex and html sections--
#                           -- to for rebuild for changes to these .sed files.
# modified 08/28/2008 (DC) -Added 54*.png processing to eps: target
# 			   -Added rm 2\*.eps to eps: tagget; \*=not wild card
# modified 01/15/2010 (DC) -Added 555.sml
# modified 01/15/2010 (DC) -Added png to eps processing for 45???.png images
#                           Some authors send me .png instead of prefered .eps
# This shrinks screen capture height eps:
YRES=108

SRC = intro.sml \
      basic.sml \
      dc.sml \
      ac.sml \
      discrete.sml \
      a_ic.sml \
      d_ic.sml \
      555.sml \
      about.sml \
      contrib.sml \
      dsl.sml \
      hi.latex \
      hi_appendix.latex \
      bye.latex \
      hi_1.html \
      hi_2.html \
      hi_3.html \
      hi_4.html \
      hi_5.html \
      hi_6.html \
      hi_7.html \
      hi_8.html \
      hi_A1.html \
      hi_A2.html \
      hi_A3.html \
      bye_1.html \
      bye_2.html \
      bye_3.html \
      bye_4.html \
      bye_5.html \
      bye_6.html \
      bye_7.html \
      bye_8.html \
      bye_A1.html \
      bye_A2.html \
      bye_A3.html \
      index.html \
      Makefile

output:
	mkdir -p output

link: | output
	ln -rsf *.png *.jpg *.html output



# Generates HTML output
html : $(SRC) sml2html.sed
	make EXP_1.html
	make EXP_2.html
	make EXP_3.html
	make EXP_4.html
	make EXP_5.html
	make EXP_6.html
	make EXP_7.html
	make EXP_8.html
	make EXP_A1.html
	make EXP_A2.html
	make EXP_A3.html

include utils.mak

chapter_names := \
      intro \
      basic \
      dc \
      ac \
      discrete \
      a_ic \
      d_ic \
      555

chapters := $(call sourcefile,$(chapter_names))
latex_chapters := $(call latexfile,$(chapter_names))
get_chapter = $(word $(1),$(chapters))

appendix_names := \
      about \
      contrib \
      dsl
appendices := $(call sourcefile,$(appendix_names))
latex_appendices := $(call latexfile,$(appendix_names))
get_appendix = $(word $(1),$(appendices))

%.latex: %.sml sml2latx.sed
	sed -f sml2latx.sed $< > $@
	if [ $(if $(filter $<,$(appendices)),1,0) -eq 1 ]; then \
	    cp $@ .$@; \
	    sed  s/\\minitoc//g .$@ > $@; \
	    rm .$@; \
	fi

.SECONDEXPANSION:
EXP_%.html : $$(call get_chapter,%) hi_%.html bye_%.html sml2html.sed
	cat hi_$*.html > $@
	sed -f sml2html.sed $< >> $@
	cat bye_$*.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@ 

EXP_A%.html : $$(call get_appendix,%) hi_A%.html bye_A%.html sml2html.sed
	cat hi_A$*.html > $@
	sed -f sml2html.sed $< >> $@
	cat bye_A$*.html >> $@


# Generates DVI output using LaTeX
EXP.latex : $(latex_chapters) $(latex_appendices) sml2latx.sed
	cat hi.latex \
           $(latex_chapters) \
           hi_appendix.latex \
           $(latex_appendices) \
           bye.latex > $@

latex: EXP.latex
	latex EXP.latex
	makeindex EXP.idx
	latex EXP.latex
	latex EXP.latex
	touch latex


# Generates compressed PostScript and PDF output
EXP.ps : $(SRC)
	make latex
	dvips -z -Ppdf -o EXP.ps EXP.dvi
	ps2pdf EXP.ps EXP.pdf
	gzip -f EXP.ps


%.png: %.eps
	mogrify -density 120 -format png $<

eps_source_files := $(wildcard *.eps)
output_pngs := $(eps_source_files:.eps=.png)

.PHONY: png
png: $(output_pngs)


# Converts photograph .jpg graphics into .eps format
# Don't have png2eps? Then use eps2: target instead of eps: target It
# only needs mogrify. But images files are larger, Images not as nice.
# This (eps2: or eps:) is only required for TeX/LaTeX.
eps2: $(SRC)
	mogrify -density 175 -format eps 4*.jpg
	mogrify -density 175 -format eps 5*.jpg
	touch eps


# Convert *.jpg to .eps -smaller .eps files than above, alternative to above
# Why am I looking at $(SRC) list, what good does it do?
# Edits to make file and $(SRC) force a make.
eps: $(SRC)
	YRES=108  #Y resolution to shrink height, 72 normal
	for file in 2*.png; do \
	../bin/png2eps $$file $(YRES) >`echo $$file | sed -ne 's/png/eps/p;'`; \
	done
	rm 2\*.eps
# 08/29/2008 (DC) This makes eps from png artwork later it is scaled 50%#####
# these 4*.png's should really numbered like screen captures (25*.png)
# However those are scaled differently
# 
	for file in 4*.png; do \
	../bin/png2eps $$file  >`echo $$file | sed -ne 's/png/eps/p;'`; \
	done
# end make eps from png
# continue with jpeg processing

	for file in 5*.jpg; do \
	cp $$file $$file'~' ; \
	done

	for file in 4*.jpg; do \
	cp $$file $$file'~' ; \
	done

	../bin/jpeg2eps 4*.jpg
	../bin/jpeg2eps 5*.jpg


	for file in 4*.eps; do \
	cp $$file $$file'~' ; \
	done

	for file in 5*.eps; do \
	cp $$file $$file'~' ; \
	done

	for file in 5*.eps; do \
	cp $$file $$file'~' ; \
	done
	
	for file in 4*.eps; do \
	../bin/./scale.sh 50% $$file'~' $$file ; \
	done

	for file in 5*.eps; do \
	../bin/./scale.sh 50% $$file'~' $$file ; \
	done

#	modify for each directory
	rm 45*.jpg~
	rm 55*.jpg~
	rm 45*.eps~
	rm 55*.eps~
	touch eps


# Generates a .tar.gz archive containing source files
EXPsrc.tar.gz: $(SRC)
	tar cvf EXPsrc.tar \
            $(SRC) \
            *.eps \
            *.jpg \
            *.png \
            *.lps \
            *.sed \
            toc.map \
            htmltoc2 \
            Makefile
	gzip -f EXPsrc.tar


# Generates a .tar.gz archive containing only ESSENTIAL source files
EXPtiny.tar.gz: $(SRC)
	tar cvf EXPtiny.tar \
            $(SRC) \
             0*.eps \
             1*.eps \
	     4*.[jp][pn]g \
             5*.jpg \
            previous.jpg \
            contents.jpg \
            next.jpg \
            ps.* \
            pdf.* \
            src1.* \
            src2.* \
            *.lps \
            *.sed \
            toc.map \
            htmltoc2 \
            Makefile
	gzip -f EXPtiny.tar


# Cleans out old, unwanted files
clean:
	-rm *.bak
	-rm *.spn
	-rm junk*
	-rm core

