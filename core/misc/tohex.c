#include <stdio.h>

char hexchar[] = "0123456789ABCDEF";

int
main()
{
	char c;

	while(scanf("%c", &c) != -1)
	{
		unsigned u = c;
		printf("%c%c\n", hexchar[(u>>4)&15], hexchar[u&15]);
	}

	return 0;
}
