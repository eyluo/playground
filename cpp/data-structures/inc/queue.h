/**
 * @file queue.h
 * 
 * @brief queue interface using the linked list interface.
 */

#ifndef _QUEUE_H_
#define _QUEUE_H_

#include "dll.h"

class Queue : public LinkedList {
    public:

    Queue(void);

    bool enqueue(int data);

    int dequeue(void);

    void clear(void);
};

#endif