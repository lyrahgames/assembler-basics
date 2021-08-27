TARGET := hello
SOURCES := $(wildcard *.s)
OBJECTS := $(SOURCES:.s=.o)

.PHONY: update clean test

update: $(TARGET)

clean:
	rm -f $(TARGET) $(OBJECTS)

test: $(TARGET)
	qemu-riscv64 $<

$(TARGET): $(OBJECTS)
	riscv64-linux-gnu-ld -o $@ $^

%.o: %.s
	riscv64-linux-gnu-as -o $@ $<
