all: normaliza

# Group work
TEAM = ae11-bbb

CC = gcc

INCLUDE = .

ifdef DEBUG
	# Options for debug
	CFLAGS = -g -Wall -DDEBUG
else
	# Options for release
	CFLAGS = -O3 -Wall
endif

.SUFFIXES:		.c
.c.o:
	$(CC) $(CFLAGS) -I$(INCLUDE) -c $<
	
normaliza: normaliza.o libFD.o
	$(CC)  -o $(@) $^
	
clean:
	-rm -rf *.o normaliza

clean-all:
	-rm -rf *.o normaliza *.tar.gz $(TEAM) Debug Release
	
tar:
	-mkdir --parents $(TEAM) && \
	cp --archive *.h *.c Makefile README $(TEAM) && \
	tar czvf $(TEAM).tar.gz $(TEAM) && \
	rm -rf $(TEAM)