/**
 * @file stack.h
 * 
 * @brief stack interface using the linked list interface.
 */

#ifndef _STACK_H_
#define _STACK_H_

#include "dll.h"

class Stack {
    private:

    LinkedList dll;

    public:

    Stack(void);

    bool insert(int data);

    int pop(void);

    int size(void);

    void clear(void);
};

#endif