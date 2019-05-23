TEST = ./bin/test

dll: test.o dll.o stack.o queue.o
	g++ -o $(TEST) test.o dll.o stack.o queue.o

clean:
	rm $(TEST)
	rm *.o