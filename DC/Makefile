# Makefile for textbook Volume 1: DC.

output:
	mkdir -p output

link: | output
	ln -rsf *.png *.jpg *.html output


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
html_chapters := $(call htmlfile,DC_,$(chapter_names))
get_chapter = $(word $(1),$(chapters))

appendix_names := \
      about \
      contrib \
      dsl
appendices := $(call sourcefile,$(appendix_names))
latex_appendices := $(call latexfile,$(appendix_names))
html_appendices := $(call htmlfile,DC_A,$(appendix_names))
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

latex_templates := $(patsubst %,%.latex,hi hi_appendix bye)
DC.latex : $(latex_chapters) $(latex_appendices) $(latex_templates)
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



%.png: %.eps
	mogrify -density 120 -format png $<

eps_source_files := $(wildcard *.eps)
output_pngs := $(eps_source_files:.eps=.png)
pdf_figures := $(eps_source_files:.eps=.pdf)

DC.pdf: DC.latex $(pdf_figures)
	pdflatex $<
	makeindex DC.idx
	pdflatex $<
	pdflatex $<

%.pdf: %.eps
	ps2pdf -dEPSCrop $< $@

.PHONY: png pdf_figures
png: $(output_pngs)



# Cleans out old, unwanted files
clean:
	-rm *.bak
	-rm *.spn
	-rm junk*
	-rm core
