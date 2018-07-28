VERSION=4
INSTALLDIR=~/ChromeExtensions

NAME=disable-craislist-hoverbox
DISTNAME=$(NAME)-$(VERSION)

%.zip:manifest.json *.js *.html *.png *.css
	zip $@ $^

all: $(DISTNAME).zip

clean:
	rm -rf *~ $(DISTNAME).zip

dist: $(DISTNAME).zip
	cp $< ~/Desktop

install: $(DISTNAME).zip
	rm -rf $(INSTALLDIR)/$(NAME)
	mkdir -p $(INSTALLDIR)/$(NAME)
	cp $< $(INSTALLDIR)/$(NAME)
	pushd $(INSTALLDIR)/$(NAME) && \
		unzip $(DISTNAME).zip && \
		rm $(DISTNAME).zip && \
		popd
	@echo "Reload the extension in chrome://extensions"

distclean:
	rm -rf $(DISTNAME).zip ~/Desktop/$(DISTNAME).zip

allclean: clean distclean
