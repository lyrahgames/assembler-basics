TARGET := hello
SOURCES := $(wildcard *.s)
OBJECTS := $(SOURCES:.s=.o)

CC := riscv64-linux-gnu-gcc
RUNNER := qemu-riscv64 -L /usr/riscv64-linux-gnu

.PHONY: update clean test

update: $(TARGET)

clean:
	rm -f $(TARGET) $(OBJECTS)

test: $(TARGET)
	$(RUNNER) $<

$(TARGET): $(OBJECTS)
	$(CC) -o $@ $^

%.o: %.s
	$(CC) -o $@ -c $<
