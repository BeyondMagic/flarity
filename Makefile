# flarity - A personal terminal emulator.
# See LICENSE file for copyright and license details.
.POSIX:

include config.mk

SRC = flarity.c x.c boxdraw.c hb.c
OBJ = $(SRC:.c=.o)

all: options flarity

options:
	@echo flarity build options:
	@echo "CFLAGS  = $(STCFLAGS)"
	@echo "LDFLAGS = $(STLDFLAGS)"
	@echo "CC      = $(CC)"

config.h:
	cp config.def.h config.h

.c.o:
	$(CC) $(STCFLAGS) -c $<

flarity.o: config.h flarity.h win.h
x.o: arg.h config.h flarity.h win.h hb.h
hb.o: flarity.h
boxdraw.o: config.h flarity.h boxdraw_data.h

$(OBJ): config.h config.mk

flarity: $(OBJ)
	$(CC) -o $@ $(OBJ) $(STLDFLAGS)

clean:
	rm -f flarity $(OBJ) flarity-$(VERSION).tar.gz

dist: clean
	mkdir -p flarity-$(VERSION)
	cp -R FAQ LEGACY TODO LICENSE Makefile README config.mk\
		config.def.h flarity.info flarity.1 arg.h flarity.h win.h $(SRC)\
		flarity-$(VERSION)
	tar -cf - flarity-$(VERSION) | gzip > flarity-$(VERSION).tar.gz
	rm -rf flarity-$(VERSION)

install: flarity
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f flarity $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/flarity
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < flarity.1 > $(DESTDIR)$(MANPREFIX)/man1/flarity.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/flarity.1
	tic -sx flarity.info
	rm -f *.o
	@echo Please see the README file regarding the terminfo entry of flarity.

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/flarity
	rm -f $(DESTDIR)$(MANPREFIX)/man1/flarity.1

.PHONY: all options clean dist install uninstall
