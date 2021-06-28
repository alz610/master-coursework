all: build #run

build:
	soffice --headless --convert-to docx main.odt
	soffice --headless --convert-to pdf main.odt

run:
	# Я использую xreader для просмотра PDF
	# xreader main.pdf &
	okular main.pdf &

clean: