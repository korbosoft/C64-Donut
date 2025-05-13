#include <conio.h>
#include <string.h>
#include "data/donut.h"

#define COLUMNS 19
#define ROWS 18
#define FRAMES 79

char donutbuffer[COLUMNS + 1];

extern int setupAndStartPlayer();

int main(void) {
    register unsigned int i;
    register unsigned char y = 0;
    setupAndStartPlayer();
    textcolor(1);
    for (;;) {
        for (i = 0; i < FRAMES*ROWS; ++i) {
            memcpy(donutbuffer, donut + i * COLUMNS, COLUMNS + 1);
            donutbuffer[COLUMNS] = '\0';
            cputsxy(11, y, donutbuffer);
            ++y;
            y %= ROWS;
        }
    }
}
