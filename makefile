CC = gcc
CFLAGS = -std=gnu99 -pedantic -Wall
main: main.o file1.o file2.o file3.o
	gcc -o main  main.o file1.o file2.o file3.o
%.o: %.c
	gcc $(CFLAGS) -c $<
.PHONY: clean
clean:
	rm -f main *.o *~
all: main

depend:
	makedepend file1.c file2.c file3.c
file1.o :file1.h
file2.o: file2.h
file3.o: file3.h file2.h
