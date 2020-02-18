# Makefile for managing "Lessons In Electric Circuits -- Digital"
# modified  01/7/2006 (DC) -Added mini-TOC  to each chapter of html, .latex

# modified 11/01/2007 (DC) - eps: target modified for smaller better looking (pdf) files
# modified 11/01/2007 (DC) -Added bibliography to .html, .latex pending for others; .tex, .txt, etc
# modified 11/01/2007 (DC) -Removed  bibliography to .html, .latex pending for others; .tex, .txt, etc
# modified 10/03/2008 (DC) -Added sml2latx.sed, sml2html.sed to Latex and html sections--
#                           -- to for rebuild for changes to these .sed files.

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
html_chapters := $(call htmlfile,DIGI_,$(chapter_names))
get_chapter = $(word $(1),$(chapters))

appendix_names := \
      about \
      contrib \
      dsl
appendices := $(call sourcefile,$(appendix_names))
latex_appendices := $(call latexfile,$(appendix_names))
html_appendices := $(call htmlfile,DIGI_A,$(appendix_names))
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

latex_templates := $(patsubst %,%.latex,hi hi_appendix bye)
DIGI.latex : $(latex_chapters) $(latex_appendices) $(latex_templates)
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


%.png: %.eps
	mogrify -density 120 -format png $<

eps_source_files := $(wildcard *.eps)
output_pngs := $(eps_source_files:.eps=.png)
pdf_figures := $(eps_source_files:.eps=.pdf)

DIGI.pdf: DIGI.latex $(pdf_figures)
	pdflatex $<
	makeindex DIGI.idx
	pdflatex $<
	pdflatex $<

%.pdf: %.eps
	ps2pdf -dEPSCrop $< $@

.PHONY: png pdf_figures
png: $(output_pngs)


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

