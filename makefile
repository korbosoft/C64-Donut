##############################################################################################
# cc65 floating point lib
##############################################################################################

SYS ?= c64

ifeq ($(SYS),c64)
  VICE_CMD = x64sc
endif

ifeq ($(SYS),vic20)
  VICE_CMD = xvic -memory all
  CC65_FLAGS = -C vic20-32k.cfg
endif

all: runtime.lib C64-Donut.prg main

runtime.lib: float.s floatc.c float.inc
	ca65 -t $(SYS) float.s -o float.o
	cc65 -t $(SYS) floatc.c -o floatc.s
	ca65 -t $(SYS) floatc.s -o floatc.o
	ar65 a runtime.lib float.o floatc.o

C64-Donut.prg: runtime.lib math.h float.h main.c
#	cl65 $(CC65_FLAGS) -Osir main.c runtime.lib -o C64-Donut.prg
	cl65 $(CC65_FLAGS) main.c runtime.lib -o C64-Donut.prg
#	cc65 $(CC65_FLAGS) main.c -o C64-Donut.prg

main: main.c math.h float.h
	gcc -O2 -W -Wall -Wextra -o main -lm main.c

run: C64-Donut.prg
	$(VICE_CMD) -autostartprgmode 1 C64-Donut.prg

clean:
	$(RM) main.s runtime.lib floatc.s C64-Donut.prg main
	$(RM) *~
	$(RM) *.prg *.o *.map *.lbl *.log *.lst *.d64
