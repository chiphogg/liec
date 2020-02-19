# Makefile for textbook Volume 2: AC.

output:
	mkdir -p output

sources := $(wildcard *.png *.jpg *.html)
source_links := $(patsubst %,output/%,$(sources))
output/%.html: %.html | output
	ln -rsf $< $@
output/%.png: %.png | output
	ln -rsf $< $@
output/%.jpg: %.jpg | output
	ln -rsf $< $@

link: $(source_links) | output

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
latex_chapters := $(call latexoutput,$(chapter_names))
html_chapters := $(call htmlfile,AC_,$(chapter_names))
get_chapter = $(word $(1),$(chapters))

appendix_names := \
      about \
      contrib \
      dsl
appendices := $(call sourcefile,$(appendix_names))
latex_appendices := $(call latexoutput,$(appendix_names))
html_appendices := $(call htmlfile,AC_A,$(appendix_names))
get_appendix = $(word $(1),$(appendices))

# Generates HTML output
html : $(html_chapters) $(html_appendices)

output/%.latex: %.sml sml2pdflatex.sed
	sed -f sml2pdflatex.sed $< > $@
	if [ $(if $(filter $<,$(appendices)),1,0) -eq 1 ]; then \
	    cp $@ $@_; \
	    sed  s/^.minitoc//g $@_ > $@; \
	    rm $@_; \
	fi

.SECONDEXPANSION:
AC_%.html : $$(call get_chapter,%) $$(call html_templates,hi_ bye_,%) sml2html.sed
	cat $(call html_templates,hi_,$*) > $@
	sed -f sml2html.sed $< >> $@
	cat $(call html_templates,bye_,$*) >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@ 

AC_A%.html : $$(call get_appendix,%) $$(call html_templates,hi_A bye_A,%) sml2html.sed
	cat $(call html_templates,hi_A,$*) > $@
	sed -f sml2html.sed $< >> $@
	cat $(call html_templates,bye_A,$*) >> $@

output/AC.latex : $(latex_chapters) $(latex_appendices) $(call latex_templates,hi hi_appendix bye)
	cat $(call latex_templates,hi) \
        $(latex_chapters) \
        $(call latex_templates,hi_appendix) \
        $(latex_appendices) \
        $(call latex_templates,bye) > $@

# Converts schematic and equation .eps graphics into .png format
%.png: %.eps
	mogrify -density 120 -format png $<

eps_source_files := $(wildcard *.eps)
output_pngs := $(eps_source_files:.eps=.png)
pdf_figures := $(patsubst %.eps,output/%.pdf,$(eps_source_files))

output/AC.pdf: output/AC.latex $(pdf_figures)
	pdflatex -output-directory output $<
	makeindex output/AC.idx
	pdflatex -output-directory output $<
	pdflatex -output-directory output $<

output/%.pdf: %.eps
	ps2pdf -dEPSCrop $< $@

.PHONY: png pdf_figures
png: $(output_pngs)


# Cleans out old, unwanted files
clean:
	-rm *.bak
	-rm *.spn
	-rm junk*
	-rm core
