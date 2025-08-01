test: 
	gzdoom -iwad doom2.wad -file . -nomonsters

e1m1:
	gzdoom -iwad doom2.wad -file . -nomonsters +map e1m1

e1m3:
	gzdoom -iwad doom2.wad -file . -nomonsters +map e1m3

e1m6:
	gzdoom -iwad doom2.wad -file . -nomonsters +map e1m6

monsters: 
	gzdoom -iwad doom2.wad -file .  +map e1m6
