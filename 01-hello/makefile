TARGET := hello
SOURCES := $(wildcard *.s)
OBJECTS := $(SOURCES:.s=.o)

.PHONY: update clean test

update: $(TARGET)

clean:
	rm -f $(TARGET) $(OBJECTS)

test: $(TARGET)
	./$<

$(TARGET): $(OBJECTS)
	ld -o $@ $^

%.o: %.s
	as -o $@ $<
