IDIR=include
CC=gcc
CFLAGS=-I$(IDIR)

ODIR=src/obj
SRCDIR=src
LDIR=lib

LIBS=-lm

_DEPS = input_handler.h

DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = shell.o input_handler.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

_SRCDIR = %.c
SRC = $(patsubst %,$(SRCDIR)/%,$(_SRCDIR))

$(ODIR)/%.o: $(SRC) $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

ishell: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~