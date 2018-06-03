
build:
	docker run -it --rm  -v `pwd`:/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf pfc.adoc -a pdf-stylesdir=. -a pdf-style=themes/basic-theme.yml -r  asciidoctor-mathematical -a pdf-fontsdir=./fonts/

clean:
	rm -rf _images/stem*
