#include <stdio.h>
#include <stdlib.h>

char conv(char c)
{
	switch (c) {
	case '0': return 0x0;
	case '1': return 0x1;
	case '2': return 0x2;
	case '3': return 0x3;
	case '4': return 0x4;
	case '5': return 0x5;
	case '6': return 0x6;
	case '7': return 0x7;
	case '8': return 0x8;
	case '9': return 0x9;
	case 'A': return 0xa;
	case 'B': return 0xb;
	case 'C': return 0xc;
	case 'D': return 0xd;
	case 'E': return 0xe;
	case 'F': return 0xf;
	}

	fprintf(stderr, "Warning: invalid character\n");
	return 255;
}

int main()
{
	char a, b;
	while (scanf("%c%c\n", &a, &b) != -1)
	{
		char c = conv(a) * 16 + conv(b);
		printf("%c", c);
	}
}
