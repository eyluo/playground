/**
 * @file queue.cpp
 * 
 * @brief queue implementation using the linked list implementation.
 */

#include <cstdlib>
#include "inc/queue.h"

Queue::Queue(void) {
    this->size = 0;
    this->head = NULL;
    this->tail = NULL;
}

bool Queue::enqueue(int data) {
    return this->add_to_end(data);
}

int Queue::dequeue(void) {
    return this->remove_from_front();
}

void Queue::clear(void) {
    this->free_list();
}