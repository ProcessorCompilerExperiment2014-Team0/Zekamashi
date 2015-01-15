#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

char hexchar[] = "0123456789ABCDEF";

int
main(int argc, char** argv)
{
	int  w;

	if (argc == 1) {
		w = 1;
	} else {
		w = atoi(argv[1]);
	}

	char data[w];
	bool first_time = true;
	while (fread(data, sizeof(char), w, stdin) == (size_t)w) {
		if (!first_time) printf("\n"); else first_time = false;
		for (int i = w-1; i >= 0; i--)
			printf("%c%c", hexchar[(data[i]>>4)&15], hexchar[data[i]&15]);	
	}

	return 0;
}
