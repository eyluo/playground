/**
 * @file stack.cpp
 * 
 * @brief stack implementation using the linked list implementation.
 */

#include <cstdlib>
#include "inc/stack.h"

Stack::Stack(void) {
    this->size = 0;
    this->head = NULL;
    this->tail = NULL;
}

bool Stack::insert(int data) {
    return this->add_to_end(data);
}

int Stack::pop(void) {
    return this->remove_from_end();
}

void Stack::clear(void) {
    this->free_list();
}