# Makefile for managing "Lessons In Electric Circuits -- DC"
# modified  01/7/2006 (DC) -Added mini-TOC  to each chapter of html, .latex
# modified 10/03/2006 (DC) -Added bibliography to .html, .latex pending for others; .tex, .txt, etc
# modified 10/03/2006 (DC) -moved bibliography to chapters
# modified 10/03/2008 (DC) -Added sml2latx.sed, sml2html.sed to Latex and html sections--
#                           -- to for rebuild for changes to these .sed files.
#
YRES=108

SRC = basiccon.sml \
      ohm.sml \
      safety.sml \
      scientif.sml \
      s_and_p.sml \
      divider.sml \
      s_p.sml \
      dcmeter.sml \
      dcsignal.sml \
      dcnet.sml \
      batt.sml \
      conduct.sml \
      cap.sml \
      magnet.sml \
      inductor.sml \
      time.sml \
      dcmotor.sml \
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
	make DC_1.html
	make DC_2.html
	make DC_3.html
	make DC_4.html
	make DC_5.html
	make DC_6.html
	make DC_7.html
	make DC_8.html
	make DC_9.html
	make DC_10.html
	make DC_11.html
	make DC_12.html
	make DC_13.html
	make DC_14.html
	make DC_15.html
	make DC_16.html
	make DC_A1.html
	make DC_A2.html
	make DC_A3.html


include utils.mak
chapter_names := \
      basiccon \
      ohm \
      safety \
      scientif \
      s_and_p \
      divider \
      s_p \
      dcmeter \
      dcsignal \
      dcnet \
      batt \
      conduct \
      cap \
      magnet \
      inductor \
      time

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
DC_%.html : $$(call get_chapter,%) hi_%.html bye_%.html sml2html.sed
	cat hi_$*.html > $@
	sed -f sml2html.sed $< >> $@
	cat bye_$*.html >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@ 

DC_A%.html : $$(call get_appendix,%) hi_A%.html bye_A%.html sml2html.sed
	cat hi_A$*.html > $@
	sed -f sml2html.sed $< >> $@
	cat bye_A$*.html >> $@

# Generates DVI output using LaTeX
DC.latex : $(latex_chapters) $(latex_appendices) sml2latx.sed
	cat hi.latex \
           $(latex_chapters) \
           hi_appendix.latex \
           $(latex_appendices) \
           bye.latex > $@

latex: DC.latex
	latex DC.latex
	makeindex DC.idx
	latex DC.latex
	latex DC.latex
	touch latex



# Generates PostScript and PDF output
DC.ps : $(SRC)
	make latex
	dvips -Ppdf -o DC.ps DC.dvi
	ps2pdf DC.ps DC.pdf
	gzip -f DC.ps



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
	rm 40*.jpg~
	rm 50*.jpg~
	rm 40*.eps~
	rm 50*.eps~
	touch eps


# Generates a .tar.gz archive containing source files
DCsrc.tar.gz: $(SRC)
	tar cvf DCsrc.tar \
            $(SRC) \
            *.eps \
            *.jpg \
            *.png \
            *.lps \
            *.sed \
            hi* \
            bye* \
            toc.map \
            htmltoc2 \
            Makefile
	gzip -f DCsrc.tar




# Generates a .tar.gz archive containing only ESSENTIAL source files
DCtiny.tar.gz: $(SRC)
	tar cvf DCtiny.tar \
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
	gzip -f DCtiny.tar



# Cleans out old, unwanted files
clean:
	-rm *.bak
	-rm *.spn
	-rm junk*
	-rm core

