#include <cbm.h>
#include <conio.h>
#include <string.h>

#include "data/donut.h"
#include "data/screen.h"

#define COLUMNS 19
#define ROWS 18
#define FRAMES 79

char donutbuffer[COLUMNS + 1];

extern int setupAndStartPlayer();

int main(void) {
    register unsigned int i;
    register unsigned char y = 0;
    clrscr();
    bordercolor(0);
    textcolor(1);
    memcpy((unsigned*)0x6D0, screen, screen_size);
    memset((unsigned*)0xD800, 0x01, 1000);
    setupAndStartPlayer();
    for (;;) {
        for (i = 0; i < FRAMES*ROWS; ++i) {
            memcpy(donutbuffer, donut + i * COLUMNS, COLUMNS + 1);
            donutbuffer[COLUMNS] = '\0';
            cputsxy(11, y, donutbuffer);
            ++y;
            y %= ROWS;
            cbm_k_scnkey();
            if (cbm_k_getin() == 0x0D) {
                clrscr();
                __asm__ ("jmp $FCE2"); // cold reset
            }
        }
    }
}
