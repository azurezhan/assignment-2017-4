RMD_FILE = index.Rmd
PDF_FILE = assignment-2017-4.pdf
HTML_FILE = ${RMD_FILE:%.Rmd=%.html}
MD_FILE = README.md
BIB = assignment4.bib

all: $(PDF_FILE) $(HTML_FILE) $(MD_FILE) $(BIB)

$(PDF_FILE): $(RMD_FILE) $(wildcard includes/*.tex) $(BIB)
	Rscript -e 'rmarkdown::render("$<",output_format="pdf_document",output_file="$@")'

$(HTML_FILE): $(RMD_FILE) $(wildcard includes/*.html) $(BIB)
	Rscript -e 'rmarkdown::render("$<",output_format="html_document",output_file="$@")'

$(MD_FILE): $(RMD_FILE) $(BIB)
	Rscript -e 'rmarkdown::render("$<",output_format="md_document",output_file="$@")'
