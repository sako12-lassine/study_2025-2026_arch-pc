all:
	pandoc lab02.md -o lab02.docx
	pandoc lab02.md -o lab02.pdf --pdf-engine=xelatex -V mainfont="DejaVu Serif"

pdf:
	pandoc lab02.md -o lab02.pdf --pdf-engine=xelatex -V mainfont="DejaVu Serif"

docx:
	pandoc lab02.md -o lab02.docx

clean:
	rm -rf lab02.pdf lab02.docx

cleanall: clean
	rm -rf .quarto _output
