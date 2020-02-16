# Makefile for managing "Lessons In Electric Circuits -- Digital"
# modified  01/7/2006 (DC) -Added mini-TOC  to each chapter of html, .latex

# modified 11/01/2007 (DC) - eps: target modified for smaller better looking (pdf) files
# modified 11/01/2007 (DC) -Added bibliography to .html, .latex pending for others; .tex, .txt, etc
# modified 11/01/2007 (DC) -Removed  bibliography to .html, .latex pending for others; .tex, .txt, etc
# modified 10/03/2008 (DC) -Added sml2latx.sed, sml2html.sed to Latex and html sections--
#                           -- to for rebuild for changes to these .sed files.

#This shrinks screen capture height eps:
YRES=108




SRC = numbers.sml \
      binary.sml \
      gates.sml \
      switches.sml \
      relays.sml \
      ladder.sml \
      boolean.sml \
      karnaugh.sml \
      combin.sml \
      multivib.sml \
      counters.sml \
      shiftreg.sml \
      a2d.sml \
      commun.sml \
      memory.sml \
      computer.sml \
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
      hi_9.html \
      hi_10.html \
      hi_11.html \
      hi_12.html \
      hi_13.html \
      hi_14.html \
      hi_15.html \
      hi_16.html \
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
      bye_9.html \
      bye_10.html \
      bye_11.html \
      bye_12.html \
      bye_13.html \
      bye_14.html \
      bye_15.html \
      bye_16.html \
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
	make DIGI_1.html
	make DIGI_2.html
	make DIGI_3.html
	make DIGI_4.html
	make DIGI_5.html
	make DIGI_6.html
	make DIGI_7.html
	make DIGI_8.html
	make DIGI_9.html
	make DIGI_10.html
	make DIGI_11.html
	make DIGI_12.html
	make DIGI_13.html
	make DIGI_14.html
	make DIGI_15.html
	make DIGI_16.html
	make DIGI_A1.html
	make DIGI_A2.html
	make DIGI_A3.html


include utils.mak

chapter_names := \
      numbers \
      binary \
      gates \
      switches \
      relays \
      ladder \
      boolean \
      karnaugh \
      combin \
      multivib \
      counters \
      shiftreg \
      a2d \
      commun \
      memory \
      computer

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
DIGI_%.html : $$(call get_chapter,%) hi_%.html bye_%.html sml2html.sed
	cat hi_$*.html > $@
	sed -f sml2html.sed $< >> $@
	cat bye_$*.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@ 

DIGI_A%.html : $$(call get_appendix,%) hi_A%.html bye_A%.html sml2html.sed
	cat hi_A$*.html > $@
	sed -f sml2html.sed $< >> $@
	cat bye_A$*.html >> $@

# Generates DVI output using LaTeX
DIGI.latex : $(latex_chapters) $(latex_appendices) sml2latx.sed
	cat hi.latex \
           $(latex_chapters) \
           hi_appendix.latex \
           $(latex_appendices) \
           bye.latex > $@

latex: DIGI.latex
	latex DIGI.latex
	makeindex DIGI.idx
	latex DIGI.latex
	latex DIGI.latex
	touch latex



# Generates compressed PostScript and PDF output
DIGI.ps : $(SRC)
	make latex
	dvips -z -Ppdf -o DIGI.ps DIGI.dvi
	ps2pdf DIGI.ps DIGI.pdf
	gzip -f DIGI.ps




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

eps: $(SRC)
	YRES=108  #Y resolution to shrink height, 72 normal
	for file in 2*.png; do \
	../bin/png2eps $$file $(YRES) >`echo $$file | sed -ne 's/png/eps/p;'`; \
	done

#08/29/2008 (DC) This makes eps from png artwork later it is scaled 50%#####
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

	for file in 4*.eps; do \
	../bin/./scale.sh 50% $$file'~' $$file ; \
	done

	for file in 5*.eps; do \
	../bin/./scale.sh 50% $$file'~' $$file ; \
	done

#	modify for each directory
	rm 44*.jpg~
	rm 54*.jpg~
	rm 44*.eps~
	rm 54*.eps~
	touch eps





# Generates a .tar.gz archive containing source files
DIGIsrc.tar.gz: $(SRC)
	tar cvf DIGIsrc.tar \
            $(SRC) \
            *.eps \
            *.jpg \
            *.png \
            *.lps \
            *.sed \
            toc.map \
            htmltoc2 \
            Makefile
	gzip -f DIGIsrc.tar




# Generates a .tar.gz archive containing only ESSENTIAL source files
DIGItiny.tar.gz: $(SRC)
	tar cvf DIGItiny.tar \
            $(SRC) \
            0*.eps \
            1*.eps \
            4*.jpg \
            4*.png \
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
	gzip -f DIGItiny.tar


# Cleans out old, unwanted files
clean:
	-rm *.bak
	-rm *.spn
	-rm junk*
	-rm core

