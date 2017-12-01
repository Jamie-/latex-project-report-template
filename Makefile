.PHONY: clean compile bib
.DEFAULT_GOAL: compile

compile: report.pdf

bib: out/report.blg

clean:
	rm -rf report.pdf word_count.txt out/*

report.pdf: word_count.txt *.tex appendices/*.tex out/report.blg
	pdflatex -halt-on-error -output-directory out report.tex
	mv out/report.pdf .

out/report.blg: bib.bib
	pdflatex -halt-on-error -output-directory out report.tex
	biber out/report
	pdflatex -halt-on-error -output-directory out report.tex
	mv out/report.pdf .

word_count.txt: abstract.tex acknowledgements.tex introduction.tex lit_review.tex analysis.tex design.tex conclusion.tex
	texcount -1 -sum abstract.tex acknowledgements.tex introduction.tex lit_review.tex analysis.tex design.tex conclusion.tex > word_count.txt
