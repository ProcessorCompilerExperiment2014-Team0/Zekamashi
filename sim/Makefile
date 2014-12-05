targ = amatsukaze
CC = g++
CPPFLAGS = -Wall -O2
LOADLIBES = -lm

all: $(targ)

exec.o: exec.cpp exec.h

amatsukaze: amatsukaze.o exec.o

clean:
	rm -rf $(targ) *.o

.PHONY: all clean
