.PHONY: all
all: chello

chello.o: chello.c
	gcc -c chello.c -o chello.o

writeexit.o: writeexit.s
	as writeexit.s -o writeexit.o

chello: chello.o writeexit.o
	ld -N chello.o writeexit.o -o chello

DELETE= chello.o writeexit.o chello

.PHONY: clean
clean:
	rm -rf $(DELETE)
