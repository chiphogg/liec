# Makefile for textbook Volume 6: Experiments.

output:
	mkdir -p output

sources := $(wildcard figures/*.png figures/*.jpg)
source_links := $(patsubst figures/%,output/%,$(sources))
output/%.png: figures/%.png | output
	cp $< $@
output/%.jpg: figures/%.jpg | output
	cp $< $@

output/index.html: index.html | output
	cp $< $@

link: $(source_links) | output

include utils.mak

chapter_names := \
      intro \
      basic \
      dc \
      ac \
      discrete \
      a_ic \
      d_ic \
      555

chapters := $(call sourcefile,$(chapter_names))
latex_chapters := $(call latexoutput,$(chapter_names))
html_chapters := $(call htmloutput,EXP_,$(chapter_names))
get_chapter = $(word $(1),$(chapters))

appendix_names := \
      about \
      contrib \
      dsl
appendices := $(call sourcefile,$(appendix_names))
latex_appendices := $(call latexoutput,$(appendix_names))
html_appendices := $(call htmloutput,EXP_A,$(appendix_names))
get_appendix = $(word $(1),$(appendices))

# Generates HTML output
html : $(html_chapters) $(html_appendices) png output/index.html

output/%.latex: %.sml sml2pdflatex.sed
	sed -f sml2pdflatex.sed $< > $@
	if [ $(if $(filter $<,$(appendices)),1,0) -eq 1 ]; then \
	    cp $@ $@_; \
	    sed  s/\\minitoc//g $@_ > $@; \
	    rm $@_; \
	fi

.SECONDEXPANSION:
output/EXP_%.html : $$(call get_chapter,%) $$(call html_templates,hi_ bye_,%) sml2html.sed
	cat $(call html_templates,hi_,$*) > $@
	sed -f sml2html.sed $< >> $@
	cat $(call html_templates,bye_,$*) >> $@
	./htmltoc2 -inline -noorg  -toclabel " " -tocmap toc.map \
        -minitoc "<\!\-\-\minitoc\-\->" $@ 

output/EXP_A%.html : $$(call get_appendix,%) $$(call html_templates,hi_A bye_A,%) sml2html.sed
	cat $(call html_templates,hi_A,$*) > $@
	sed -f sml2html.sed $< >> $@
	cat $(call html_templates,bye_A,$*) >> $@

output/EXP.latex : $(latex_chapters) $(latex_appendices) $(call latex_templates,hi hi_appendix bye)
	cat $(call latex_templates,hi) \
           $(latex_chapters) \
           $(call latex_templates,hi_appendix) \
           $(latex_appendices) \
           $(call latex_templates,bye) > $@

output/%.png: figures/%.eps
	mogrify -density 120 -path output -format png $<

eps_source_files := $(wildcard figures/*.eps)
output_pngs := $(patsubst figures/%.eps,output/%.png,$(eps_source_files))
pdf_figures := $(patsubst figures/%.eps,output/%.pdf,$(eps_source_files))

output/EXP.pdf: output/EXP.latex $(pdf_figures) | link
	pdflatex -output-directory output $<
	makeindex output/EXP.idx
	pdflatex -output-directory output $<
	pdflatex -output-directory output $<

output/%.pdf: figures/%.eps
	ps2pdf -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -dPDFSETTINGS=/printer -dEPSCrop $< $@

.PHONY: png pdf_figures link
png: $(output_pngs)


# Cleans out old, unwanted files
clean:
	-rm *.bak
	-rm *.spn
	-rm junk*
	-rm core
