VERSION=1

NAME=disable-craislist-hoverbox
DISTNAME=$(NAME)-$(VERSION)

%.zip:manifest.json *.js *.html *.png *.css
	zip $@ $^

all: $(DISTNAME).zip

test: $(DISTNAME).zip
	rm -rf ~/Desktop/$(DISTNAME)
	mkdir -p ~/Desktop/$(DISTNAME)
	cp $< ~/Desktop/$(DISTNAME)
	pushd ~/Desktop/$(DISTNAME) && \
		unzip $(DISTNAME).zip && \
		rm $(DISTNAME).zip && \
		popd

clean:
	rm -rf *~ $(DISTNAME).zip

dist: $(DISTNAME).zip
	cp $< ~/Desktop

distclean:
	rm -rf $(DISTNAME).zip ~/Desktop/$(DISTNAME).zip

allclean: clean distclean
