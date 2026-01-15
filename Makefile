test: 
	../uzdoom -iwad doom2.wad -file . -nomonsters

e1m1:
	../uzdoom -iwad doom2.wad -file . -nomonsters +map e1m1

e1m3:
	../uzdoom -iwad doom2.wad -file . -nomonsters +map e1m3

e1m4:
	../uzdoom -iwad doom2.wad -file . -nomonsters +map e1m4

e1m5:
	../uzdoom -iwad doom2.wad -file . -nomonsters +map e1m5 -nomusic

e1m6:
	../uzdoom -iwad doom2.wad -file . -nomonsters +map e1m6 -skill 4 -nomusic

monsters: 
	../uzdoom -iwad doom2.wad -file . -nomusic #+map e1m6 -skill 4 
