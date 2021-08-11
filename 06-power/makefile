TARGET := power
SOURCES := main.s

.PHONY: update clean test

update: $(TARGET)

clean:
	rm -f $(TARGET)

test: $(TARGET)
	./$< 10 13
	./$< -5 8
	./$< 952 -457

# We need static linkage to compile the program.
# Moving the address of labels seems to be the problem.
$(TARGET): $(SOURCES)
	gcc -o $@ $^ -static
