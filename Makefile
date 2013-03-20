GCC  = cc

RELEASE_FLAGS = -Ofast -Wall
DEBUG_FLAGS  = -O0 -Wall -g3 -v -fdump-final-insns=rtl -fmem-report -fstack-usage -save-temps

RELEASE_NAME = chentropy
DEBUG_NAME = chentropy_debug

IFILE = chentropy.c

# Amount of memory to alloc on autorun, Megs
STD_SOURCE = /dev/urandom

release :
	$(GCC) $(IFILE) $(LIBS) $(RELEASE_FLAGS) -o $(RELEASE_NAME)

debug :
	$(GCC) $(IFILE) $(LIBS) $(DEBUG_FLAGS) -o $(DEBUG_NAME)

####################

run : release
	./$(RELEASE_NAME) < $(STD_SOURCE)

dbrun : debug
	./$(DEBUG_NAME) < $(STD_SOURCE)

gdb : debug
	@echo "--------------------------------------------------"
	gdb --args ./$(DEBUG_NAME) $(STD_SOURCE)

#####################

clean :
	rm -f *.ii *.i *.o *.s *.su rtl $(RELEASE_NAME) $(DEBUG_NAME)