/** 
 * @file dll.cpp
 * 
 * @brief implementation of doubly linked lists. 
 */

#include <cstdlib>
#include "inc/dll.h"

/** @brief the Node class, used for the Linked List implementation. */
class LinkedList::Node {
    public:
    int data;
    Node *prev;
    Node *next;
};

/** @brief initializes a LinkedList object pointer. */
LinkedList::LinkedList(void) {
    this->size = 0;
    this->head = NULL;
    this->tail = NULL;
}

/** @brief appends data to the end of a Linked List.
 * 
 *  @param data int to add into the list. Requires that data is non-negative.
 * 
 *  @return true if successfully added, else false.
 */
bool LinkedList::add_to_end(int data) {
    // allocate a node, in case of failure, abort.
    Node *node = new Node;
    if (node == NULL) {
        return false;
    }

    // populates the node struct.
    node->data = data;
    node->prev = this->tail;
    node->next = NULL;

    // if the list is empty, set the head to the node too. Otherwise, set the
    // tail to point to the new node.
    if (this->head == NULL) {
        this->head = node;
    } else {
        this->tail->next = node;
    }

    this->tail = node;
    this->size++;

    return true;
}

/** @brief prepends data to the end of a Linked List.
 * 
 *  @param data int to add into the list. Requires that data is non-negative.
 * 
 *  @return true if successfully added, else false.
 */
bool LinkedList::add_to_front(int data) {
    // allocate a node, in case of failure, abort.
    Node *node = new Node;
    if (node == NULL)
    {
        return false;
    }

    // populates the node struct.
    node->data = data;
    node->prev = NULL;
    node->next = this->head;

    // if the list is empty, set the tail to the node too. Otherwise, set the
    // head to point to the new node.
    if (this->head == NULL)
    {
        this->tail = node;
    }
    else
    {
        this->head->prev = node;
    }

    this->head = node;
    this->size++;

    return true;
}

/** @brief dequeues from the front of the Linked List.
 * 
 *  @return data at the front of the list.
 */
int LinkedList::remove_from_front(void) {
    // if empty, return -1.
    if (this->head == NULL) {
        return -1;
    }

    // get rid of the node.
    int result = this->head->data;
    Node *temp = this->head;
    this->head = this->head->next;

    delete temp;

    this->size--;

    return result;
}

/** @brief pops from the end of the Linked List.
 * 
 *  @return data at the end of the list.
 */
int LinkedList::remove_from_end(void) {
    // if empty, return -1.
    if (this->tail == NULL) {
        return -1;
    }

    // get rid of the node.
    int result = this->tail->data;
    Node *temp = this->tail;
    this->tail = this->tail->prev;

    delete temp;

    this->size--;

    return result;
}

/** @brief frees the Linked List. */
void LinkedList::free_list(void) {
    Node *temp = this->head;
    while (temp != NULL) {
        this->head = temp->next;
        delete temp;
        temp = this->head;
    }

    delete this;
}