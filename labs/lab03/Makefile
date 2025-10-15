all:
	pandoc report.md -o report.docx
	pandoc report.md -o report.pdf --pdf-engine=xelatex -V mainfont="DejaVu Serif"

pdf:
	pandoc report.md -o report.pdf --pdf-engine=xelatex -V mainfont="DejaVu Serif"

docx:
	pandoc report.md -o report.docx

clean:
	rm -rf report.pdf report.docx

cleanall: clean
	rm -rf .quarto _output
