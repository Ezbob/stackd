DC = gdc
EXEC = stack
CFLAGS =
SRCS = main.d stack.d
HDRS = 
OBJS = $(SRCS:.d=.o)

.PHONY: all clean run

all: $(SRCS) $(EXEC) 

$(EXEC): $(OBJS)
	$(DC) $^ -o $@
	
%.o: %.d
	$(DC) $(CFLAGS) $^ -c -o $@

run: $(SRCS) $(EXEC)
	./$(EXEC)

clean:
	$(RM) -rf *.o $(EXEC)
