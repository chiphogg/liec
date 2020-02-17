# Makefile for managing "Lessons In Electric Circuits -- Semiconductors"
# modified 06/14/2005 (DC) 2*.png \ added to SEMItiny.tar:
# modified 06/14/2005 (DC) -Added  mogrify -density 175 -format eps 2*.png to eps:
# modified  01/7/2006 (DC) -Added mini-TOC  to each chapter of html, .latex
# modified 08/02/2006 (DC) - eps: target modified for smaller better looking (pdf) files
# modified 10/03/2006 (DC) -Added bibliography to .html, .latex pending for others; .tex, .txt, etc
# modified 04/39/2007 (DC) -Removed  bibliography to .html, .latex pending for others; .tex, .txt, etc
# modified 10/03/2008 (DC) -Added sml2latx.sed, sml2html.sed to Latex and html sections--
#                           -- to for rebuild for changes to these .sed files.

#This shrinks screen capture height eps:
YRES=108

SRC = amplif.sml \
      theory.sml \
      diode.sml \
      bjt.sml \
      jfet.sml \
      mosfet.sml \
      thyr.sml \
      opamp.sml \
      analog.sml \
      active.sml \
      dcdrive.sml \
      acdrive.sml \
      tubes.sml \
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
      bye_11.html \
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
      bye_A1.html \
      bye_A2.html \
      bye_A3.html \
      index.html \
      Makefile

output:
	mkdir -p output

link: | output
	ln -rsf *.png *.jpg *.html output




include utils.mak

chapter_names := \
      amplif \
      theory \
      diode \
      bjt \
      jfet \
      mosfet \
      thyr \
      opamp \
      analog \
      active \
      dcdrive \
      acdrive \
      tubes
chapters := $(call sourcefile,$(chapter_names))
latex_chapters := $(call latexfile,$(chapter_names))
html_chapters := $(call htmlfile,SEMI_,$(chapter_names))
get_chapter = $(word $(1),$(chapters))

appendix_names := \
      about \
      contrib \
      dsl
appendices := $(call sourcefile,$(appendix_names))
latex_appendices := $(call latexfile,$(appendix_names))
html_appendices := $(call htmlfile,SEMI_A,$(appendix_names))
get_appendix = $(word $(1),$(appendices))

# Generates HTML output
html : $(html_chapters) $(html_appendices)

%.latex: %.sml sml2pdflatex.sed
	sed -f sml2pdflatex.sed $< > $@
	if [ $(if $(filter $<,$(appendices)),1,0) -eq 1 ]; then \
	    cp $@ .$@; \
	    sed  s/\\minitoc//g .$@ > $@; \
	    rm .$@; \
	fi

.SECONDEXPANSION:
SEMI_%.html : $$(call get_chapter,%) hi_%.html bye_%.html sml2html.sed
	cat hi_$*.html > $@
	sed -f sml2html.sed $< >> $@
	cat bye_$*.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@ 

SEMI_A%.html : $$(call get_appendix,%) hi_A%.html bye_A%.html sml2html.sed
	cat hi_A$*.html > $@
	sed -f sml2html.sed $< >> $@
	cat bye_A$*.html >> $@

latex_templates := $(patsubst %,%.latex,hi hi_appendix bye)
SEMI.latex : $(latex_chapters) $(latex_appendices) $(latex_templates)
	cat hi.latex \
           $(latex_chapters) \
           hi_appendix.latex \
           $(latex_appendices) \
           bye.latex > $@

latex: SEMI.latex
	latex SEMI.latex
	makeindex SEMI.idx
	latex SEMI.latex
	latex SEMI.latex
	touch latex



# Generates compressed PostScript and PDF output
#SEMI.ps : $(SRC)
SEMI.ps :
	make latex
	dvips -z -Ppdf -o SEMI.ps SEMI.dvi
	ps2pdf SEMI.ps SEMI.pdf
	gzip -f SEMI.ps



%.png: %.eps
	mogrify -density 120 -format png $<

eps_source_files := $(wildcard *.eps)
output_pngs := $(eps_source_files:.eps=.png)
pdf_figures := $(eps_source_files:.eps=.pdf)

SEMI.pdf: SEMI.latex $(pdf_figures)
	pdflatex $<
	makeindex SEMI.idx
	pdflatex $<
	pdflatex $<

%.pdf: %.eps
	ps2pdf -dEPSCrop $< $@

.PHONY: png pdf_figures
png: $(output_pngs)



# Converts photograph .jpg graphics into .eps format
# Don't have png2eps? Then use eps2: target instead of eps: target It
# only needs mogrify. But images files are larger, Images not as nice.
# This (eps2: or eps:) is only required for TeX/LaTeX.

eps2: $(SRC)
	mogrify -density 175 -format eps 2*.png
	mogrify -density 175 -format eps 4*.jpg
	mogrify -density 175 -format eps 5*.jpg
	touch eps



# Convert *.jpg to .eps -smaller .eps files than above, alternative to above

eps: $(SRC)
	YRES=108  #Y resolution to shrink height, 72 normal
	for file in 2*.png; do \
	../bin/png2eps $$file $(YRES) >`echo $$file | sed -ne 's/png/eps/p;'`; \
	done

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
	rm 43*.jpg~
	rm 53*.jpg~
	rm 43*.eps~
	rm 53*.eps~
	touch eps


# Generates a .tar.gz archive containing source files
SEMIsrc.tar.gz: $(SRC)
	tar cvf SEMIsrc.tar \
            $(SRC) \
            *.eps \
            *.jpg \
            *.png \
            *.lps \
            *.sed \
            toc.map \
            htmltoc2 \
            Makefile
	gzip -f SEMIsrc.tar




# Generates a .tar.gz archive containing only ESSENTIAL source files
SEMItiny.tar.gz: $(SRC)
	tar cvf SEMItiny.tar \
            $(SRC) \
            0*.eps \
            1*.eps \
            2*.png \
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
	gzip -f SEMItiny.tar



# Cleans out old, unwanted files
clean:
	-rm *.bak
	-rm *.spn
	-rm junk*
	-rm core

