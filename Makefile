##############################################################################################
# c64 donut makefile1!!! fukc yeah
##############################################################################################

all: C64-Donut.prg

C64-Donut.prg: data/donut main.c sid.asm splash.asm data/song.sid
	rm -f temp.sid temp.prg main crunched.prg
	cd data && python ../donut.py
	cd data && bin2c -o donut.h donut
	cd data && bin2c -o screen.h screen
	sidreloc -p A0 data/song.sid temp.sid
	psid64 -n temp.sid
	cl65 main.c sid.asm -Oirs
	exomizer sfx 2061 main temp.prg -o crunched.prg -s "jsr highest_addr_out" -x "dec $d020"
	kickass splash.asm -o c64-donut.prg
	rm -f temp.sid temp.prg main crunched.prg
run: C64-Donut.prg
	x64sc -autostartprgmode 1 c64-donut.prg

clean:
	$(RM) c64-donut.prg
	$(RM) *.prg *.o *.s *.map *.lbl *.log *.lst *.d64 main temp.sid
