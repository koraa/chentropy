#include <stdio.h>
#include <string.h>
#include <math.h>
#include <inttypes.h>
#include <stdlib.h>

int absmod(int i, int m) { return abs(i%m); }


char* lib = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
int libl;

int minl = 5, maxl = 40;

int main() {
    //////////////////////////
    // INIT
    
    libl = strlen(lib);

    //////////////////////////
    // BODY
    char c; 
    while(1) {
        c = getchar();
        int tow = minl + (absmod(c, maxl - minl));

        while(tow-- > 0) {
            c = getchar();
            putc(lib[absmod(c, libl)], stdout);
        }
        putc('\n', stdout);
    }

    return 0;
}
