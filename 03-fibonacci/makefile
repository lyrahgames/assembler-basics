TARGET := fibonacci
SOURCES := main.s

.PHONY: update clean test

update: $(TARGET)

clean:
	rm -f $(TARGET)

test: $(TARGET)
	./$<

# We need static linkage to compile the program.
$(TARGET): $(SOURCES)
	gcc -o $@ $^ -static
