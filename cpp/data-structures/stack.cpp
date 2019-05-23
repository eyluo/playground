/**
 * @file stack.cpp
 * 
 * @brief stack implementation using the linked list implementation.
 */

#include <cstdlib>
#include "inc/stack.h"

Stack::Stack(void) {
    this->dll.size = 0;
    this->dll.head = NULL;
    this->dll.tail = NULL;
}

bool Stack::insert(int data) {
    return this->dll.add_to_end(data);
}

int Stack::pop(void) {
    return this->dll.remove_from_end();
}

int Stack::size(void) {
    return this->dll.size;
}

void Stack::clear(void) {
    this->dll.free_list();
}