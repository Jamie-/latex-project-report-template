.PHONY: clean compile bib
.DEFAULT_GOAL: compile

## Set out directory
OUT = out

## Document name
NAME = report

compile: $(NAME).pdf

bib: $(OUT)/$(NAME).blg

clean:
	rm -rf $(NAME).pdf word_count.txt $(OUT)*

$(NAME).pdf:  $(OUT)/ word_count.txt *.tex appendices/*.tex $(OUT)/$(NAME).blg
	pdflatex -halt-on-error -output-directory out $(NAME).tex
	mv $(OUT)/$(NAME).pdf .

$(OUT)/:
	mkdir out

$(OUT)/$(NAME).blg: bib.bib
	pdflatex -halt-on-error -output-directory $(OUT) $(NAME).tex
	biber $(OUT)/$(NAME)
	pdflatex -halt-on-error -output-directory $(OUT) $(NAME).tex
	mv $(OUT)/$(NAME).pdf .

word_count.txt: abstract.tex acknowledgements.tex introduction.tex lit_review.tex analysis.tex design.tex conclusion.tex
	texcount -1 -sum abstract.tex acknowledgements.tex introduction.tex lit_review.tex analysis.tex design.tex conclusion.tex > word_count.txt
