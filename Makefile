test: 
	../uzdoom -iwad doom2.wad -file . $(EXTRA)

e1m1:
	../uzdoom -iwad doom2.wad -file . -nomonsters +map e1m1 $(EXTRA)

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
