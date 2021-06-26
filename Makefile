all: build_nosync #run

build: extra/title.pdf
	latexmk -xelatex -synctex=1 main.tex

build_nosync: extra/title.pdf
	latexmk -xelatex main.tex

build_odt:
	soffice --headless --convert-to docx main.odt
	
rebuild: extra/title.pdf
	latexmk -g -use-make -xelatex -synctex=1 main.tex

rebuild_nosync: extra/title.pdf
	latexmk -g -use-make -xelatex main.tex

extra/title.pdf: extra/title.odt
	soffice --headless --convert-to pdf extra/title.odt --outdir extra

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
