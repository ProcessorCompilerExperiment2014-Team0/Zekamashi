#include <stdio.h>
#include <string.h>

int
main(int argc, char **argv) {
  char str1[100];
  char str2[100];
  FILE *f1, *f2;
  int i;

  if (argc != 3) {
    puts("usage: chechdump file1 file2\n");
    return 0;
  }

  if ((f1 = fopen(argv[1], "r")) == NULL) {
    perror("");
    return 1;
  }

  if ((f2 = fopen(argv[2], "r")) == NULL) {
    perror("");
    fclose(f1);
    return 1;
  }

  i = 1;
  while(fgets(str1, 99, f1) && fgets(str2, 99, f2)) {
    if (strcmp(str1, str2) != 0) {
      printf("found diff at l%d\n", i);
      return 0;
    }
    i++;
  }

  printf("no diff\n");

  fclose(f1);
  fclose(f2);

  return 0;
}
