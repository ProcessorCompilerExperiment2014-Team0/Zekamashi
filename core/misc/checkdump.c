#include <stdio.h>
#include <string.h>

#define BUFNUM 10
#define BUFSIZE 1000

char buf[BUFNUM][BUFSIZE];
int bufidx = 0;

char* buf1;
char buf2[BUFSIZE];


char*
chompsucc(char* str)
{
  int i;
  for (i=0; str[i] != '\0'; i++)
    if (str[i] == '\n' || str[i] == '\r') {
      str[i] = '\n';
      str[i+1] = '\0';
      break;
    }
      
  return &str[i+1];
}

int
main(int argc, char **argv) {
  FILE *f1, *f2;

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

  for (int ninst = 0;; ninst++) {
    char *s1 = buf1 = buf[bufidx];
    char *s2 = buf2;

    for (int i = 0; i < 34; i++) {
      if (! (fgets(s1, 30, f1) && fgets(s2, 30, f2))) {
        printf("no diff\n");
        goto end;
      }
      s1 = chompsucc(s1);
      s2 = chompsucc(s2);
    }

    if (strcmp(buf1, buf2) == 0) {
      bufidx = (bufidx + 1)%BUFNUM;
    } else {
      printf("found diff at %dth inst\n\n", ninst);

      int i = ((bufidx - 1) + BUFNUM) % BUFNUM;
      while (i != bufidx) {
        printf("%s", buf[i]);
        i = ((i - 1) + BUFNUM) % BUFNUM;
      }
      puts("A:");
      printf("%s", buf1);
      puts("B:");
      printf("%s", buf2);
      goto end;
    }
  }

end:

  fclose(f1);
  fclose(f2);

  return 0;
}
