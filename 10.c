// problem 1 & 2
// gcc 10.c && ./a.out

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

static void transform(const char * input, char * output) {
  int repeated = 1;
  char last_c = input[0];
  int j = 0;

  for (int i = 1; input[i]; ++i) {
    char c = input[i];

    if (last_c == c) {
      repeated += 1;
    } else {
      output[j++] = '0' + repeated;
      output[j++] = last_c;
      last_c = c;
      repeated = 1;
    }
  }

  output[j++] = '0' + repeated;
  output[j++] = last_c;
  output[j] = 0;
}

int main(int argc, char * argv[]) {
  char * buf1 = malloc(200 * 1024 * 1024);
  char * buf2 = malloc(200 * 1024 * 1024);
  sprintf(buf1, "3113322113");

  for (int i = 1; i <= 50; ++i) {
    transform(buf1, buf2);

    if (i == 40 || i == 50) {
      printf("%lu\n", strlen(buf2));
    }

    char * tmp = buf1;
    buf1 = buf2;
    buf2 = tmp;
  }

}
