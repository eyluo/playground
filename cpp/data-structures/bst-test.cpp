#include <cstdlib>
#include <iostream>
#include "inc/bst.h"

using namespace std;

#define BUFSIZE 32

int main(void) {
    BinarySearchTree *tree = new BinarySearchTree(112, 122);

    char cmd;
    int arg1, arg2;

    while (1) {
        cout << "$ ";
        cin >> cmd;
        switch (cmd) {
            case 'i':
                cout << "$ [key] [value]: ";
                cin >> arg1 >> arg2;
                tree->insert(arg1, arg2);
                break;

            case 'f':
                cout << "$ [key]: ";
                cin >> arg1;
                cout << tree->find(arg1) << "\n";
                break;

            case 's':
                cout << tree->size() << "\n";
                break;

            case '1':
                tree->preorder();
                break;

            case '2':
                tree->inorder();
                break;

            case '3':
                tree->postorder();
                break;

            case 'q':
                delete tree;
                cout << "Exiting...\n";
                return 0;

            default:
                DEFAULT:
                cout << "Invalid command. Please try again.\n";
                break;
        }
    }
}