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


# Converts SubML source into LaTeX source
intro.latex : intro.sml sml2latx.sed
	sed -f sml2latx.sed intro.sml > intro.latex

basic.latex : basic.sml sml2latx.sed
	sed -f sml2latx.sed basic.sml > basic.latex

dc.latex : dc.sml sml2latx.sed
	sed -f sml2latx.sed dc.sml > dc.latex

ac.latex : ac.sml sml2latx.sed
	sed -f sml2latx.sed ac.sml > ac.latex

discrete.latex : discrete.sml sml2latx.sed
	sed -f sml2latx.sed discrete.sml > discrete.latex

a_ic.latex : a_ic.sml sml2latx.sed
	sed -f sml2latx.sed a_ic.sml > a_ic.latex

d_ic.latex : d_ic.sml sml2latx.sed
	sed -f sml2latx.sed d_ic.sml > d_ic.latex

555.latex : 555.sml sml2latx.sed
	sed -f sml2latx.sed 555.sml > 555.latex

about.latex : about.sml sml2latx.sed
	sed -f sml2latx.sed about.sml > about.latex
	#no mini-TOC for this chapter-- remove it
	cp about.latex about.latex~
	sed  s/\\minitoc//g about.latex~ >about.latex
	rm about.latex~
	
contrib.latex : contrib.sml sml2latx.sed
	sed -f sml2latx.sed contrib.sml > contrib.latex
	#no mini-TOC for this chapter-- remove it
	cp contrib.latex contrib.latex~
	sed  s/\\minitoc//g contrib.latex~ >contrib.latex
	rm contrib.latex~

dsl.latex : dsl.sml sml2latx.sed
	sed -f sml2latx.sed dsl.sml > dsl.latex
	#no mini-TOC for this chapter-- remove it
	cp dsl.latex dsl.latex~
	sed  s/\\minitoc//g dsl.latex~ >dsl.latex
	rm dsl.latex~


# Converts SubML source into HTML source
# toc.map is necessary to htmltoc2 perl script
# added htmltoc2 for mini-table of contnets in chapters
EXP_1.html : intro.sml hi_1.html bye_1.html sml2html.sed
	cat hi_1.html > $@
	sed -f sml2html.sed intro.sml >> $@
	cat bye_1.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

EXP_2.html : basic.sml hi_2.html bye_2.html sml2html.sed
	cat hi_2.html > $@
	sed -f sml2html.sed basic.sml >> $@
	cat bye_2.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

EXP_3.html : dc.sml hi_3.html bye_3.html sml2html.sed
	cat hi_3.html > $@
	sed -f sml2html.sed dc.sml >> $@
	cat bye_3.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

EXP_4.html : ac.sml hi_4.html bye_4.html sml2html.sed
	cat hi_4.html > $@
	sed -f sml2html.sed ac.sml >> $@
	cat bye_4.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

EXP_5.html : discrete.sml hi_5.html bye_5.html sml2html.sed
	cat hi_5.html > $@
	sed -f sml2html.sed discrete.sml >> $@
	cat bye_5.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

EXP_6.html : a_ic.sml hi_6.html bye_6.html sml2html.sed
	cat hi_6.html > $@
	sed -f sml2html.sed a_ic.sml >> $@
	cat bye_6.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

EXP_7.html : d_ic.sml hi_7.html bye_7.html sml2html.sed
	cat hi_7.html > $@
	sed -f sml2html.sed d_ic.sml >> $@
	cat bye_7.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

EXP_8.html : 555.sml hi_8.html bye_8.html sml2html.sed
	cat hi_8.html > $@
	sed -f sml2html.sed 555.sml >> $@
	cat bye_8.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

EXP_A1.html : about.sml hi_A1.html bye_A1.html  sml2html.sed
	cat hi_A1.html > $@
	sed -f sml2html.sed about.sml >> $@
	cat bye_A1.html >> $@

EXP_A2.html : contrib.sml hi_A2.html bye_A2.html  sml2html.sed
	cat hi_A2.html > $@
	sed -f sml2html.sed contrib.sml >> $@
	cat bye_A2.html >> $@

EXP_A3.html : dsl.sml hi_A3.html bye_A3.html  sml2html.sed
	cat hi_A3.html > $@
	sed -f sml2html.sed dsl.sml >> $@
	cat bye_A3.html >> $@


# Generates DVI output using LaTeX
latex : $(SRC) sml2latx.sed
	make intro.latex
	make basic.latex
	make dc.latex
	make ac.latex
	make discrete.latex
	make a_ic.latex
	make d_ic.latex
	make 555.latex
	make about.latex
	make contrib.latex
	make dsl.latex
	cat hi.latex \
           intro.latex \
           basic.latex \
           dc.latex \
           ac.latex \
           discrete.latex \
           a_ic.latex \
           d_ic.latex \
           555.latex \
           hi_appendix.latex \
           about.latex \
           contrib.latex \
           dsl.latex \
           bye.latex > EXP.latex
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

