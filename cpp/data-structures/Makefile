TEST = ./bin/test
BST = ./bin/bst-test

dll: test.o dll.o stack.o queue.o
	g++ -o $(TEST) test.o dll.o stack.o queue.o

bst: bst-test.o bst.o
	g++ -o $(BST) bst-test.o bst.o

clean:
	rm $(TEST)
	rm $(BST)
	rm *.o