/**
 * @file queue.cpp
 * 
 * @brief queue implementation using the linked list implementation.
 */

#include <cstdlib>
#include "inc/queue.h"

Queue::Queue(void) {
    this->dll.size = 0;
    this->dll.head = NULL;
    this->dll.tail = NULL;
}

bool Queue::enqueue(int data) {
    return this->dll.add_to_end(data);
}

int Queue::dequeue(void) {
    return this->dll.remove_from_front();
}

int Queue::size(void) {
    return this->dll.size;
}

void Queue::clear(void) {
    this->dll.free_list();
}