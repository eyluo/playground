/**
 * @file dll.h
 * 
 * @brief interface for a doubly linked list.
 */

#ifndef _DLL_H_
#define _DLL_H_

class LinkedList {
    private:

    class Node;

    public: 
    
    int size;
    
    Node *head;
    
    Node *tail;

    LinkedList(void);

    bool add_to_front(int data);

    bool add_to_end(int data);

    int remove_from_front(void);

    int remove_from_end(void);

    void free_list(void);
};

#endif