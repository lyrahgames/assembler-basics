TARGET := args
SOURCES := main.s

.PHONY: update clean test

update: $(TARGET)

clean:
	rm -f $(TARGET)

test: $(TARGET)
	./$<
	./$< arg1
	./$< arg1 arg2 arg3=tmp

# We need static linkage to compile the program.
# Moving the address of labels seems to be the problem.
$(TARGET): $(SOURCES)
	gcc -o $@ $^ -static
