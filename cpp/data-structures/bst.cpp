#include <cstdlib>
#include <iostream>

#include "inc/bst.h"

using namespace std;

void _preorder(BinarySearchTree *);
void _inorder(BinarySearchTree *);
void _postorder(BinarySearchTree *);
int _size(BinarySearchTree *);

BinarySearchTree::BinarySearchTree(int key, int data) {
    this->key = key;
    this->data = data;
    this->left = NULL;
    this->right = NULL;
}

void BinarySearchTree::insert(int key, int data) {
    if (key < this->key) {
        if (this->left != NULL) {
            this->left->insert(key, data);
        } else {
            this->left = new BinarySearchTree(key, data);
        }
    } else if (key > this->key) {
        if (this->right != NULL) {
            this->right->insert(key, data);
        } else {
            this->right = new BinarySearchTree(key, data);
        }
    } else {
        this->data = data;
    }
}

int BinarySearchTree::find(int key) {
    if (key < this->key) {
        if (this->left != NULL) {
            return this->left->find(key);
        } else return -1;
    } else if (key > this->key) {
        if (this->right != NULL) {
            return this->right->find(key);
        } else return -1;
    } else return this->data;
}

int BinarySearchTree::size(void) {
    return _size(this);
}

void BinarySearchTree::preorder(void) {
    _preorder(this);
    cout << "\n";
}

void BinarySearchTree::inorder(void) {
    _inorder(this);
    cout << "\n";
}

void BinarySearchTree::postorder(void) {
    _postorder(this);
    cout << "\n";
}

void _preorder(BinarySearchTree *BST) {
    if (BST == NULL) {
        return;
    } else {
        cout << BST->key << ":" << BST->data << " ";
        _preorder(BST->left);
        _preorder(BST->right);
    }
}

void _inorder(BinarySearchTree *BST) {
    if (BST == NULL) {
        return;
    } else {
        _inorder(BST->left);
        cout << BST->key << ":" << BST->data << " ";
        _inorder(BST->right);
    }
}

void _postorder(BinarySearchTree *BST) {
    if (BST == NULL) {
        return;
    } else {
        _postorder(BST->left);
        _postorder(BST->right);
        cout << BST->key << ":" << BST->data << " ";
    }
}

int _size(BinarySearchTree *BST) {
    if (BST == nullptr) {
        return 0;
    } else return 1 + _size(BST->left) + _size(BST->right);
}