#ifndef _BST_H_
#define _BST_H_

class BinarySearchTree {
    public:

    int key;
    int data;
    BinarySearchTree *left;
    BinarySearchTree *right;

    BinarySearchTree(int key, int data);

    void insert(int key, int data);

    int find(int key);

    int size(void);

    void preorder(void);

    void inorder(void);

    void postorder(void);

    void clean(void);
};

#endif