#include <stdio.h>
#include <string.h>
#include <math.h>
#include <inttypes.h>
#include <stdlib.h>
#include <stdbool.h>

int absmod(int i, int m) {
  return abs(i%m);
}

/**
 * Read a single int from the given stream.
 * Returns true if the read was successful,
 * false if eof was reached.
 */
bool readint(int* i, FILE *stream) {
  size_t red = fread(i, sizeof(int), 1, stdin);
  return red == sizeof(int);
}

/**
 * Read a random double ibetween 0.0 and 1.0 from the given
 * file to rd.
 * Returns false if EOF is reached.
 *
 * TODO: We could operate directly on the double.
 */
bool rrand(double *rd, FILE *stream) {
  uint64_t inn;
  size_t red = fread(&inn, sizeof(uint64_t), 1, stream);
  if (red != 1)
    return false;

  *rd = inn * 1.0 / UINT64_MAX;
  return true;
}

/**
 * Reads a random int between min and max from the given
 * stream to i;
 * Returns false if eof is reached.
 *
 * TODO: This should be optimized to save entropy
 */
bool rrandi(int *i, int min, int max, FILE *stream) {
  double d;
  if(!rrand(&d, stdin))
    return false;

  *i = d * (max-min) + min;
  return true;
}

int main(int argc, char**argv) {
  // INIT

  char* lib = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  int libl;

  int minl = 40, maxl = 40;

  // ARGS

  libl = strlen(lib);

  // BODY

  char *lbuf = malloc(maxl+1), *pt;
  char *tow = lbuf + maxl;
  int c, llen = maxl;
  while(true) {
    pt = lbuf;

    // Determine length
    if (minl < maxl) {
      if (!rrandi( &llen, minl, maxl, stdin))
        return 0;
      tow = lbuf + llen;
    }

    // Read to buffer
    while(pt < tow) {
      if (!rrandi(&c, 0, libl, stdin))
        return 0;
      *(pt++) = lib[c];
    }

    // Output
    *pt = '\n';
    size_t wrot = fwrite(lbuf, sizeof(char), llen+1, stdout);
    if (wrot != llen+1)
      return 0;
  }
}
