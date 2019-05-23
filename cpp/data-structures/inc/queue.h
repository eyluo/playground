/**
 * @file queue.h
 * 
 * @brief queue interface using the linked list interface.
 */

#ifndef _QUEUE_H_
#define _QUEUE_H_

#include "dll.h"

class Queue {
    private:

    LinkedList dll;

    public:

    Queue(void);

    bool enqueue(int data);

    int dequeue(void);

    int size(void);

    void clear(void);
};

#endif