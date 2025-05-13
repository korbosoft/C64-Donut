##############################################################################################
# c64 donut makefile1!!! fukc yeah
##############################################################################################

all: C64-Donut.prg

C64-Donut.prg: data/donut.h main.c sid.asm data/song.sid
	rm -f crunched.prg temp.sid temp.prg main
	sidreloc -p A0 data/song.sid temp.sid
	psid64 -n temp.sid
	cl65 main.c sid.asm -Oirs
	exomizer sfx 2061 main temp.prg -o crunched.prg -s "jsr highest_addr_out" -x "dec $d020 inc $d020"
	kickass splash.asm -o c64-donut.prg
	rm -f crunched.prg temp.sid temp.prg main
run: C64-Donut.prg
	x64sc -autostartprgmode 1 c64-donut.prg

clean:
	$(RM) c64-donut.prg
	$(RM) *.prg *.o *.s *.map *.lbl *.log *.lst *.d64 main temp.sid
