CC = gcc
CFLAGS = -std=gnu99 -pedantic -Wall
DBGFLAGS = -std=gnu99 -pedantic -Wall -ggdb3 -DDEBUG
SRCS = $(wildcard *.c)
OBJS = $(patsubst %.c,%.o,$(SRCS))
DBGOBJS = $(patsubst %.c,%.dbg.o,$(SRCS))

main: $(OBJS)
	gcc -o $@ -O3 $(OBJS)

main-debug: $(DBGOBJS)
	gcc -o  $@ -ggdb3 $(DBGOBJS)

%.o: %.c
	gcc $(CFLAGS) -c $<

%.dbg.o: %.c
	gcc $(DBGFLAGS) -c -o $@ $<

.PHONY: clean  all depend

clean:
	rm -f main *.o *~

all: main main-debug

depend:
	makedepend $(SRCS)
	makedepend -a -o .dbg.o $(SRCS)

file1.o :file1.h
file2.o: file2.h
file3.o: file3.h file2.h
