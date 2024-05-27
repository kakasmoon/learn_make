CC = gcc
CFLAGS = -std=gnu99 -pedantic -Wall
SRCS = $(wildcard *.c)
OBJS = $(patsubst %.c,%.o,$(SRCS))
main: $(OBJS)
	gcc -o $@ $(OBJS)
%.o: %.c
	gcc $(CFLAGS) -c $<
.PHONY: clean depend
clean:
	rm -f main *.o *~
all: main

depend:
	makedepend $(SRCS)
file1.o :file1.h
file2.o: file2.h
file3.o: file3.h file2.h
