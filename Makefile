all: build_nosync #run

build: build_title
	latexmk -xelatex -synctex=1 main.tex

build_nosync: extra/title.pdf
	latexmk -xelatex main.tex
	
rebuild: build_title
	latexmk -g -use-make -xelatex -synctex=1 main.tex

rebuild_nosync: build_title
	latexmk -g -use-make -xelatex main.tex

extra/title.pdf: extra/title.odt
	libreoffice --headless --convert-to pdf extra/title.odt --outdir extra

run:
	# Я использую xreader для просмотра PDF
	# xreader main.pdf &
	okular main.pdf &

clean:
	rm *.aux \
	*.fdb_latexmk \
	*.fls \
	*.log \
	*.out \
	*.synctex.gz \
	*.toc
