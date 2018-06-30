
# stem-latex for pdf does not work with option -o target/pfc.pdf
build: fonts
	docker run -it --rm  -v `pwd`:/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf pfc.adoc -a pdf-stylesdir=. -a pdf-style=themes/basic-theme.yml -r  asciidoctor-mathematical -a pdf-fontsdir=./fonts/ -a mathematical-format=svg
	mv pfc.pdf target/

fonts:
	mkdir fonts
	wget https://fonts.google.com/download?family=Roboto -O fonts/Roboto.zip
	cd fonts; unzip Roboto.zip;cd -
	cd fonts;mv Roboto-Regular.ttf roboto-normal.ttf; cd -
	cd fonts;mv Roboto-Italic.ttf roboto-italic.ttf; cd -
	cd fonts;mv Roboto-Bold.ttf roboto-bold.ttf; cd -
	cd fonts;mv Roboto-BoldItalic.ttf roboto-bold_italic.ttf; cd -

clean:
	rm -rf _images/stem*
	rm -rf target/*

fullclean: clean
	rm -rf fonts
