# Variables for the C compiler and linker
CC = gcc

# Flags for the C compiler
CFLAGS = -std=gnu99 -pedantic -Wall

# Object files
OBJS = file1.o file2.o file3.o main.o

# Build targets
all: main

file1.o: file1.c file1.h
	$(CC) $(CFLAGS) -o file1.o -c file1.c 

file2.o: file2.c file2.h
	$(CC) $(CFLAGS) -o file2.o -c file2.c 

file3.o: file3.c file2.h file3.h
	$(CC) $(CFLAGS) -o file3.o -c file3.c 

main.o: main.c file1.h file2.h file3.h
	$(CC) $(CFLAGS) -o main.o -c main.c

main: $(OBJS)
	$(CC) -o main $(OBJS)

# Clean up build files
.PHONY: clean
clean:
	rm -f *.o main *~

