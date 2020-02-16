
# modified  jan 2006 (DC) -Add mini-table of contents to each chapter of html
# modified  01/07/2006 (DC) -Added mini-TOC  to each chapter of html, .latex
# modified  02/01/2006 (DC) -Added new eps: target eps2: is old target.
# modified  02/01/2006 (DC) -Added hi_appendix.latex, supress TOC levels appdix.
# modified  02/01/2006 (DC) - ../bin now included in ACsrc.tar.gz, ACtiny.tar.gz
# modified  02/27/2006 (DC) - Added -z to dvips command in AC.ps target,
# modified  10/01/2006 (DC) - Added Bibliography chapter latex, html; pending: txt,tex groff
# modified 05/28/2007 (DC) -Removed  bibliography to .html, .latex pending for others; .tex, .txt, etc
# modified 10/03/2008 (DC) -Added sml2latx.sed, sml2html.sed to Latex and html sections--
#                           -- to for rebuild for changes to these .sed files.
# -see hyperref in hi.latex for pdf hyperlinks.

# 02/10/2006 Failed attempt to set TEXINPUTS path
#Add on to TEX PATH (for tocvsec2.sty) AC.ps:
#Once you get TEXINPUTS set-working you can kill the assigment below
# -It will still work until next boot- clean shell
# If all else fails see hi.latex \usepackage{tocvec2}
# Also try rm -rf AC.* to clear errors
#
# Neither of the following lines works from a clean shell, see hi.latex fix
#TEXINPUTS=$$TEXINPUTS:.:../bin/:
#TEXINPUTS=/home/dennis/lessons/bin/


#This shrinks screen capture height eps:
YRES=108


SRC = basicac.sml \
      complex.sml \
      xzl.sml \
      xzc.sml \
      xzrlc.sml \
      resonant.sml \
      mixed.sml \
      filters.sml \
      trans.sml \
      poly.sml \
      acpower.sml \
      acmeter.sml \
      acmotor.sml \
      lines.sml \
      about.sml \
      contrib.sml \
      dsl.sml \
      hi_appendix.latex \
      hi.latex \
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
      bye_A1.html \
      bye_A2.html \
      bye_A3.html \
      index.html \
      Makefile

output:
	mkdir -p output

link: | output
	ln -rsf *.png *.jpg *.html output

echotex:
	echo "TEXINPUTS= $(TEXINPUTS)"

include utils.mak

chapter_names := \
      basicac \
      complex \
      xzl \
      xzc \
      xzrlc \
      resonant \
      mixed \
      filters \
      trans \
      poly \
      acpower \
      acmeter \
      acmotor \
      lines
chapters := $(call sourcefile,$(chapter_names))
latex_chapters := $(call latexfile,$(chapter_names))
html_chapters := $(call htmlfile,AC_,$(chapter_names))
get_chapter = $(word $(1),$(chapters))

appendix_names := \
      about \
      contrib \
      dsl
appendices := $(call sourcefile,$(appendix_names))
latex_appendices := $(call latexfile,$(appendix_names))
html_appendices := $(call htmlfile,AC_A,$(appendix_names))
get_appendix = $(word $(1),$(appendices))

# Generates HTML output
html : $(html_chapters) $(html_appendices)

%.latex: %.sml sml2latx.sed
	sed -f sml2latx.sed $< > $@
	if [ $(if $(filter $<,$(appendices)),1,0) -eq 1 ]; then \
	    cp $@ .$@; \
	    sed  s/^.minitoc//g .$@ > $@; \
	    rm .$@; \
	fi

.SECONDEXPANSION:
AC_%.html : $$(call get_chapter,%) hi_%.html bye_%.html sml2html.sed
	cat hi_$*.html > $@
	sed -f sml2html.sed $< >> $@
	cat bye_$*.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@ 

AC_A%.html : $$(call get_appendix,%) hi_A%.html bye_A%.html sml2html.sed
	cat hi_A$*.html > $@
	sed -f sml2html.sed $< >> $@
	cat bye_A$*.html >> $@


# Generates DVI output using LaTeX
AC.latex : $(latex_chapters) $(latex_appendices) sml2latx.sed
	cat hi.latex \
        $(latex_chapters) \
        hi_appendix.latex \
        $(latex_appendices) \
        bye.latex > $@

latex: AC.latex
	latex AC.latex
	makeindex AC.idx
	latex AC.latex
	latex AC.latex
	touch latex


# Generates compressed PostScript and PDF output
AC.ps : $(SRC)
	make latex
	dvips -z -Ppdf -o AC.ps AC.dvi
	ps2pdf AC.ps AC.pdf
	gzip -f AC.ps




# Converts schematic and equation .eps graphics into .png format
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
#	mogrify -density 175 -format eps 2*.png # poor spice eps 10/31/1005 (DC)
	mogrify -density 20 -format eps 2*.png  # make a clean image (DC)
	mogrify -resize 24% -format eps 2*.eps  # make it smaller (DC)

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

#       jpeg2eps makes bigger eps's from jpg, so shrink them       
####	mogrify -scale 42% -format jpeg 4*.jpg~
####	mogrify -scale 42% -format jpeg 5*.jpg~

	../bin/jpeg2eps 4*.jpg
	../bin/jpeg2eps 5*.jpg


#	for file in 5*.eps; do \
#	cp $$file $$file'~' ; \
#	done

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


#	rm [45]2*.jpeg
	rm 42*.jpg~
	rm 52*.jpg~
	rm 42*.eps~
	rm 52*.eps~
	touch eps



# Generates a .tar.gz archive containing source files
ACsrc.tar.gz: $(SRC)
	tar cvf ACsrc.tar \
            $(SRC) \
            *.eps \
            *.jpg \
            *.png \
            *.lps \
            *.sed \
            toc.map \
            htmltoc2 \
            Makefile
	gzip -f ACsrc.tar




# Generates a .tar.gz archive containing only ESSENTIAL source files
ACtiny.tar.gz: $(SRC)
	tar cvf ACtiny.tar \
            $(SRC) \
            0*.eps \
            1*.eps \
            2*.png \
            4*.jpg \
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
	gzip -f ACtiny.tar


# Cleans out old, unwanted files
clean:
	-rm *.bak
	-rm *.spn
	-rm junk*
	-rm core
