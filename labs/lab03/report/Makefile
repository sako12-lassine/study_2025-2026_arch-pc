all:
	pandoc report.md -o report.docx

pdf:
	pandoc report.md -o report.pdf

clean:
	rm -rf report.pdf report.docx

cleanall: clean
	rm -rf .quarto _output
