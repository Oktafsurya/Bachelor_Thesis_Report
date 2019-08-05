PDF = pdflatex
BIB = bibtex

all : thesis.pdf

release: thesis.pdf
	cp build/thesis.pdf build/thesis_release.pdf

%.pdf : %.tex reference.bib content/*.tex
	$(PDF) --output-directory=build/ $<
	$(BIB) build/$*
	$(PDF) --output-directory=build/ $<
	$(PDF) --output-directory=build/ $<

.PHONY : clean
clean :
	cd build/ && rm -rf *.aux *.out *.log *.lof *.toc *.bbl *.blg *.fls *.fdb_latexmk *.lot *.gz *.bcf *.nav *.run.xml *.snm
