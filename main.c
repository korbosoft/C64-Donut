#include <conio.h>
#include "float.h"
#include "math.h"

#define PI2 6.28318

int main(int argc, char **argv) {
    // struct timespec req, rem;
    // req.tv_sec = 0;
    // req.tv_nsec = 16666666.666667;
    float A = 0.000004, B = 0.000002;
    float i, j;
    int k, q, r = 0;
    float z[1760];
    char b[1760];
    for(;;) {
        printf("\x1b[H");
        memset(b,32,1760);
            memset(z,0,7040);
            for(j=0; j < PI2; j += 0.07) {
                for(i=0; i < PI2; i += 0.02) {
                    float c = sin(i);
                    float d = cos(j);
                    float e = sin(A);
                    float f = sin(j);
                    float g = cos(A);
                    float h = d + 2;
                    float D = 1 / (c * h * e + f * g + 6);
                    float l = cos(i);
                    float m = cos(B);
                    float n = sin(B);
                    float t = c * h * g - f * e;
                    int x = 40 + 30 * D * (l * h * m - t * n);
                    int y = 12 + 15 * D * (l * h * n + t * m);
                    int o = x + 80 * y;

                    int N = 8 * ((f * e - c * d * g) * m - c * d * e - f * g - l * d * n);
                    if(22 > y && y > 0 && x > 0 && 80 > x && D > z[o]) {
                        z[o] = D;
                        b[o] = ".;!=?*@&AHW#"[N > 0 ? N : 0];
                    }
                }
            }
        for(k = 0; k < 1760; k++) {
            q = k % 80;
            r = k / 80;
            if (q < 19 | q > 60 | r < 2 )
                k += 19 + (r < 2);
            // printf("\x
            r = k / 80;

            // printf("\x
            // printf("\x1b[40;37m");
            putchar((k % 40 ? b[k] : 1));
            A += 0.00004;
            B += 0.00002;
        }
        // nanosleep(&req, &rem);
    }
}
