clean:
		pandoc \
			--slide-level 3 \
			--from markdown+yaml_metadata_block \
			--to beamer \
			--include-in-header presentation-header.tex \
			--output git-it-on.tex \
			README.md
		latexmk -pdflatex="pdflatex --shell-escape %O %S" -pdf git-it-on.tex

all:
		beamer
		reveal
	
beamer:
		pandoc -t beamer -i README.md -o git-it-on.pdf
		
reveal:
		pandoc \
			-i \
			-t dzslides \
			--self-contained \
			-o git-it-on.html \
			README.md 
