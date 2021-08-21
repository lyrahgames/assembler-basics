TARGET := print
SOURCES := $(wildcard *.s)
OBJECTS := $(SOURCES:.s=.o)

.PHONY: update clean test

update: $(TARGET)

clean:
	rm -f $(TARGET) $(OBJECTS)

test: $(TARGET)
	./$<

# Use the C compiler to link your target.
$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $^ $(CLIBS)

# Use the C compiler to call the assembler.
%.o: %.s
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ -c $<
