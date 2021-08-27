.PHONY: update clean test test_ccall test_cppcall

update: ccall cppcall

clean:
	rm -f ccall cppcall

test: test_ccall test_cppcall

test_ccall: ccall
	./$<

test_cppcall: cppcall
	./$<

ccall: main.c max_of_three.s | max_of_three.h
	gcc -o $@ $^

cppcall: main.cpp max_of_three.s | max_of_three.hpp
	g++ -o $@ $^
