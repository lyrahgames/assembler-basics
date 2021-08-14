TARGET := power
SOURCES := $(wildcard *.s)

.PHONY: update clean test

update: $(TARGET)

clean:
	rm -f $(TARGET)

test: $(TARGET)
	./$< 2 4
	./$< 3 2
	./$< 10 5
	./$< -5 5

# We need static linkage to compile the program.
# Moving the address of labels seems to be the problem.
$(TARGET): $(SOURCES)
	gcc -o $@ $^ -static
