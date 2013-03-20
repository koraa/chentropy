GCC  = cc

RELEASE_FLAGS = -Ofast -Wall
DEBUG_FLAGS  = -O0 -Wall -g3 -v -fdump-final-insns=rtl -fmem-report -fstack-usage -save-temps

RELEASE_NAME = chentropy
DEBUG_NAME = chentropy_debug

IFILE = chentropy.c

PREFIX = /usr/local
BIN    = $(PREFIX)/bin
TO_EXPORT = "$(RELEASE_NAME)" ./script/*

# Amount of memory to alloc on autorun, Megs
STD_SOURCE = /dev/urandom

# Default number of lines to output
STD_LEN = 30

release :
	$(GCC) $(IFILE) $(LIBS) $(RELEASE_FLAGS) -o $(RELEASE_NAME)

debug :
	$(GCC) $(IFILE) $(LIBS) $(DEBUG_FLAGS) -o $(DEBUG_NAME)

####################

install : release
	cp -v $(TO_EXPORT) $(BIN)

####################

run : release
	./$(RELEASE_NAME) < $(STD_SOURCE) | head -n $(STD_LEN)

dbrun : debug
	./$(DEBUG_NAME) < $(STD_SOURCE) | head -n $(STD_LEN)

#gdb : debug
	#@echo "--------------------------------------------------"
	#gdb --args ./$(DEBUG_NAME) < $(STD_SOURCE)

#####################

clean :
	rm -f *.ii *.i *.o *.s *.su rtl $(RELEASE_NAME) $(DEBUG_NAME)
