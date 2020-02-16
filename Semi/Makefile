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




# Generates HTML output
html : $(SRC)
	make SEMI_1.html
	make SEMI_2.html
	make SEMI_3.html
	make SEMI_4.html
	make SEMI_5.html
	make SEMI_6.html
	make SEMI_7.html
	make SEMI_8.html
	make SEMI_9.html
	make SEMI_10.html
	make SEMI_11.html
	make SEMI_12.html
	make SEMI_13.html
	make SEMI_A1.html
	make SEMI_A2.html
	make SEMI_A3.html



# Converts SubML source into LaTeX source
amplif.latex : amplif.sml sml2latx.sed
	sed -f sml2latx.sed amplif.sml > amplif.latex

theory.latex : theory.sml sml2latx.sed
	sed -f sml2latx.sed theory.sml > theory.latex

diode.latex : diode.sml sml2latx.sed
	sed -f sml2latx.sed diode.sml > diode.latex

bjt.latex : bjt.sml sml2latx.sed
	sed -f sml2latx.sed bjt.sml > bjt.latex

jfet.latex : jfet.sml sml2latx.sed
	sed -f sml2latx.sed jfet.sml > jfet.latex

mosfet.latex : mosfet.sml sml2latx.sed
	sed -f sml2latx.sed mosfet.sml > mosfet.latex

thyr.latex : thyr.sml sml2latx.sed
	sed -f sml2latx.sed thyr.sml > thyr.latex

opamp.latex : opamp.sml sml2latx.sed
	sed -f sml2latx.sed opamp.sml > opamp.latex

analog.latex : analog.sml sml2latx.sed
	sed -f sml2latx.sed analog.sml > analog.latex

active.latex : active.sml sml2latx.sed
	sed -f sml2latx.sed active.sml > active.latex

dcdrive.latex : dcdrive.sml sml2latx.sed
	sed -f sml2latx.sed dcdrive.sml > dcdrive.latex

acdrive.latex : acdrive.sml sml2latx.sed
	sed -f sml2latx.sed acdrive.sml > acdrive.latex

tubes.latex : tubes.sml sml2latx.sed
	sed -f sml2latx.sed tubes.sml > tubes.latex

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
SEMI_1.html : amplif.sml hi_1.html bye_1.html sml2html.sed
	cat hi_1.html > $@
	sed -f sml2html.sed amplif.sml >> $@
	cat bye_1.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

SEMI_2.html : theory.sml hi_2.html bye_2.html sml2html.sed
	cat hi_2.html > $@
	sed -f sml2html.sed theory.sml >> $@
	cat bye_2.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-minitoc\-\->" $@

SEMI_3.html : diode.sml hi_3.html bye_3.html sml2html.sed
	cat hi_3.html > $@
	sed -f sml2html.sed diode.sml >> $@
	cat bye_3.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-minitoc\-\->" $@

SEMI_4.html : bjt.sml hi_4.html bye_4.html sml2html.sed
	cat hi_4.html > $@
	sed -f sml2html.sed bjt.sml >> $@
	cat bye_4.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
       -minitoc "<\!\-\-minitoc\-\->" $@


SEMI_5.html : jfet.sml hi_5.html bye_5.html sml2html.sed
	cat hi_5.html > $@
	sed -f sml2html.sed jfet.sml >> $@
	cat bye_5.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-minitoc\-\->" $@

SEMI_6.html : mosfet.sml hi_6.html bye_6.html sml2html.sed
	cat hi_6.html > $@
	sed -f sml2html.sed mosfet.sml >> $@
	cat bye_6.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-minitoc\-\->" $@

SEMI_7.html : thyr.sml hi_7.html bye_7.html sml2html.sed
	cat hi_7.html > $@
	sed -f sml2html.sed thyr.sml >> $@
	cat bye_7.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-minitoc\-\->" $@

SEMI_8.html : opamp.sml hi_8.html bye_8.html sml2html.sed
	cat hi_8.html > $@
	sed -f sml2html.sed opamp.sml >> $@
	cat bye_8.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-minitoc\-\->" $@

SEMI_9.html : analog.sml hi_9.html bye_9.html sml2html.sed
	cat hi_9.html > $@
	sed -f sml2html.sed analog.sml >> $@
	cat bye_9.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-minitoc\-\->" $@

SEMI_10.html : active.sml hi_10.html bye_10.html sml2html.sed
	cat hi_10.html > $@
	sed -f sml2html.sed active.sml >> $@
	cat bye_10.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-minitoc\-\->" $@

SEMI_11.html : dcdrive.sml hi_11.html bye_11.html sml2html.sed
	cat hi_11.html > $@
	sed -f sml2html.sed dcdrive.sml >> $@
	cat bye_11.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-minitoc\-\->" $@

SEMI_12.html : acdrive.sml hi_12.html bye_12.html sml2html.sed
	cat hi_12.html > $@
	sed -f sml2html.sed acdrive.sml >> $@
	cat bye_12.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-minitoc\-\->" $@

SEMI_13.html : tubes.sml hi_13.html bye_13.html sml2html.sed
	cat hi_13.html > $@
	sed -f sml2html.sed tubes.sml >> $@
	cat bye_13.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-minitoc\-\->" $@

SEMI_A1.html : about.sml  hi_A1.html bye_A1.html sml2html.sed
	cat hi_A1.html > $@
	sed -f sml2html.sed about.sml >> $@
	cat bye_A1.html >> $@

SEMI_A2.html : contrib.sml  hi_A2.html bye_A2.html sml2html.sed
	cat hi_A2.html > $@
	sed -f sml2html.sed contrib.sml >> $@
	cat bye_A2.html >> $@

SEMI_A3.html : dsl.sml  hi_A3.html bye_A3.html sml2html.sed
	cat hi_A3.html > $@
	sed -f sml2html.sed dsl.sml >> $@
	cat bye_A3.html >> $@



# Generates DVI output using LaTeX
SEMI.latex : $(SRC) sml2latx.sed
	make amplif.latex
	make theory.latex
	make diode.latex
	make bjt.latex
	make jfet.latex
	make mosfet.latex
	make thyr.latex
	make opamp.latex
	make analog.latex
	make active.latex
	make dcdrive.latex
	make acdrive.latex
	make tubes.latex
	make about.latex
	make contrib.latex
	make dsl.latex
	cat hi.latex \
           amplif.latex \
           theory.latex \
           diode.latex \
           bjt.latex \
           jfet.latex \
           mosfet.latex \
           thyr.latex \
           opamp.latex \
           analog.latex \
           active.latex \
           dcdrive.latex \
           acdrive.latex \
           tubes.latex \
           hi_appendix.latex \
           about.latex \
           contrib.latex \
           dsl.latex \
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

.PHONY: png
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

