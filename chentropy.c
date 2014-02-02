#include <stdio.h>
#include <string.h>
#include <math.h>
#include <inttypes.h>
#include <stdlib.h>

int absmod(int i, int m) {
  return abs(i%m);
}

int main(int argc, char**argv) {
  // INIT

  char* lib = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  int libl;

  int minl = 5, maxl = 40;

  // ARGS

  if (argc > 1)
    lib = argv[0];
  libl = strlen(lib);

  // BODY

  char c;
  int tow;
  while(1) {
    c = getchar();
    tow = minl + (absmod(c, maxl - minl));

    while(tow-- > 0) {
      c = getchar();
      putc(lib[absmod(c, libl)], stdout);
    }
    putc('\n', stdout);
  }

  return 0;
}
