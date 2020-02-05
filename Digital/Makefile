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



# Converts SubML source into LaTeX source
numbers.latex : numbers.sml sml2latx.sed
	sed -f sml2latx.sed numbers.sml > numbers.latex

binary.latex : binary.sml sml2latx.sed
	sed -f sml2latx.sed binary.sml > binary.latex

gates.latex : gates.sml sml2latx.sed
	sed -f sml2latx.sed gates.sml > gates.latex

switches.latex : switches.sml sml2latx.sed
	sed -f sml2latx.sed switches.sml > switches.latex

relays.latex : relays.sml sml2latx.sed
	sed -f sml2latx.sed relays.sml > relays.latex

ladder.latex : ladder.sml sml2latx.sed
	sed -f sml2latx.sed ladder.sml > ladder.latex

boolean.latex : boolean.sml sml2latx.sed
	sed -f sml2latx.sed boolean.sml > boolean.latex

karnaugh.latex : karnaugh.sml sml2latx.sed
	sed -f sml2latx.sed karnaugh.sml > karnaugh.latex

combin.latex : combin.sml sml2latx.sed
	sed -f sml2latx.sed combin.sml > combin.latex

multivib.latex : multivib.sml sml2latx.sed
	sed -f sml2latx.sed multivib.sml > multivib.latex

counters.latex : counters.sml sml2latx.sed
	sed -f sml2latx.sed counters.sml > counters.latex

shiftreg.latex : shiftreg.sml sml2latx.sed
	sed -f sml2latx.sed shiftreg.sml > shiftreg.latex

a2d.latex : a2d.sml sml2latx.sed
	sed -f sml2latx.sed a2d.sml > a2d.latex

commun.latex : commun.sml sml2latx.sed
	sed -f sml2latx.sed commun.sml > commun.latex

memory.latex : memory.sml sml2latx.sed
	sed -f sml2latx.sed memory.sml > memory.latex

computer.latex : computer.sml sml2latx.sed
	sed -f sml2latx.sed computer.sml > computer.latex

about.latex : about.sml sml2latx.sed
	sed -f sml2latx.sed about.sml > about.latex
	#no mini-TOC for this chapter-- remove it
	cp about.latex about.latex~
	sed  s/\\minitoc//g about.latex~ >about.latex

contrib.latex : contrib.sml sml2latx.sed
	sed -f sml2latx.sed contrib.sml > contrib.latex
	#no mini-TOC for this chapter-- remove it
	cp contrib.latex contrib.latex~
	sed  s/\\minitoc//g contrib.latex~ >contrib.latex

dsl.latex : dsl.sml sml2latx.sed
	sed -f sml2latx.sed dsl.sml > dsl.latex
	#no mini-TOC for this chapter-- remove it
	cp dsl.latex dsl.latex~
	sed  s/\\minitoc//g dsl.latex~ >dsl.latex




# Converts SubML source into HTML source
# toc.map is necessary to htmltoc2 perl script
# added htmltoc2 for mini-table of contnets in chapters
DIGI_1.html : numbers.sml hi_1.html bye_1.html sml2html.sed
	cat hi_1.html > $@
	sed -f sml2html.sed numbers.sml >> $@
	cat bye_1.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_2.html : binary.sml hi_2.html bye_2.html sml2html.sed
	cat hi_2.html > $@
	sed -f sml2html.sed binary.sml >> $@
	cat bye_2.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_3.html : gates.sml hi_3.html bye_3.html sml2html.sed
	cat hi_3.html > $@
	sed -f sml2html.sed gates.sml >> $@
	cat bye_3.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_4.html : switches.sml hi_4.html bye_4.html sml2html.sed
	cat hi_4.html > $@
	sed -f sml2html.sed switches.sml >> $@
	cat bye_4.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_5.html : relays.sml hi_5.html bye_5.html sml2html.sed
	cat hi_5.html > $@
	sed -f sml2html.sed relays.sml >> $@
	cat bye_5.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_6.html : ladder.sml hi_6.html bye_6.html sml2html.sed
	cat hi_6.html > $@
	sed -f sml2html.sed ladder.sml >> $@
	cat bye_6.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_7.html : boolean.sml hi_7.html bye_7.html sml2html.sed
	cat hi_7.html > $@
	sed -f sml2html.sed boolean.sml >> $@
	cat bye_7.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_8.html : karnaugh.sml hi_8.html bye_8.html sml2html.sed
	cat hi_8.html > $@
	sed -f sml2html.sed karnaugh.sml >> $@
	cat bye_8.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_9.html : combin.sml hi_9.html bye_9.html sml2html.sed
	cat hi_9.html > $@
	sed -f sml2html.sed combin.sml >> $@
	cat bye_9.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_10.html : multivib.sml hi_10.html bye_10.html sml2html.sed
	cat hi_10.html > $@
	sed -f sml2html.sed multivib.sml >> $@
	cat bye_10.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_11.html : counters.sml hi_11.html bye_11.html sml2html.sed
	cat hi_11.html > $@
	sed -f sml2html.sed counters.sml >> $@
	cat bye_11.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_12.html : shiftreg.sml hi_12.html bye_12.html sml2html.sed
	cat hi_12.html > $@
	sed -f sml2html.sed shiftreg.sml >> $@
	cat bye_12.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_13.html : a2d.sml hi_13.html bye_13.html sml2html.sed
	cat hi_13.html > $@
	sed -f sml2html.sed a2d.sml >> $@
	cat bye_13.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_14.html : commun.sml hi_14.html bye_14.html sml2html.sed
	cat hi_14.html > $@
	sed -f sml2html.sed commun.sml >> $@
	cat bye_14.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_15.html : memory.sml hi_15.html bye_15.html sml2html.sed
	cat hi_15.html > $@
	sed -f sml2html.sed memory.sml >> $@
	cat bye_15.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_16.html : computer.sml hi_16.html bye_16.html sml2html.sed
	cat hi_16.html > $@
	sed -f sml2html.sed computer.sml >> $@
	cat bye_16.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@

DIGI_A1.html : about.sml hi_A1.html bye_A1.html sml2html.sed
	cat hi_A1.html > $@
	sed -f sml2html.sed about.sml >> $@
	cat bye_A1.html >> $@

DIGI_A2.html : contrib.sml hi_A2.html bye_A2.html sml2html.sed
	cat hi_A2.html > $@
	sed -f sml2html.sed contrib.sml >> $@
	cat bye_A2.html >> $@

DIGI_A3.html : dsl.sml hi_A3.html bye_A3.html sml2html.sed
	cat hi_A3.html > $@
	sed -f sml2html.sed dsl.sml >> $@
	cat bye_A3.html >> $@




# Generates DVI output using LaTeX
latex : $(SRC) sml2latx.sed
	make numbers.latex      
	make binary.latex
	make gates.latex
	make switches.latex
	make relays.latex
	make ladder.latex
	make boolean.latex
	make karnaugh.latex
	make combin.latex
	make multivib.latex
	make counters.latex
	make shiftreg.latex
	make a2d.latex
	make commun.latex
	make memory.latex
	make computer.latex
	make about.latex
	make contrib.latex
	make dsl.latex
	cat hi.latex \
           numbers.latex \
           binary.latex \
           gates.latex \
           switches.latex \
           relays.latex \
           ladder.latex \
           boolean.latex \
           karnaugh.latex \
           combin.latex \
           multivib.latex \
           counters.latex \
           shiftreg.latex \
           a2d.latex \
           commun.latex \
           memory.latex \
           computer.latex \
           hi_appendix.latex \
           about.latex \
           contrib.latex \
           dsl.latex \
           bye.latex > DIGI.latex
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

