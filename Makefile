VERSION=pt1

test: 
	../uzdoom -iwad doom2.wad -file . $(EXTRA)

e1m1:
	../uzdoom -iwad doom2.wad -file . -nomonsters +map e1m1 $(EXTRA)

e1m2:
	../uzdoom -iwad doom2.wad -file . -nomonsters +map e1m2 $(EXTRA)

e1m3:
	../uzdoom -iwad doom2.wad -file . -nomonsters +map e1m3 $(EXTRA)

e1m4:
	../uzdoom -iwad doom2.wad -file . -nomonsters +map e1m4 $(EXTRA)

e1m5:
	../uzdoom -iwad doom2.wad -file . -nomonsters +map e1m5 $(EXTRA)

e1m6:
	../uzdoom -iwad doom2.wad -file . -nomonsters +map e1m6 -skill 4 -nomusic $(EXTRA)

monsters: 
	../uzdoom -iwad doom2.wad -file .  +map e1m6 -skill 3 $(EXTRA)

release:
	mkdir -p release/hellis-$(VERSION) 
	zip -r release/hellis-$(VERSION)/hellis.pk3 *.txt maps/*.wad music/*.mid scripts/*.acs 
	cp readme.txt release/hellis-$(VERSION)/hellis.txt
	(cd release && zip -r hellis-$(VERSION).zip hellis-$(VERSION))
