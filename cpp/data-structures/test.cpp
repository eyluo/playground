/** @file dll-test.cpp
 * 
 *  @brief tests various functionalities of the DLL.
 */

#include <iostream>
#include <cstdlib>

// TODO: figure out how to let g++ know how to look in the inc/ directory by
//       default.
#include "inc/dll.h"
#include "inc/queue.h"
#include "inc/stack.h"

using namespace std;

#define TESTSIZE 20

int main(void) {
    cout << "Testing queue...\n";
    Queue *qtest = new Queue();

    int *arr = new int[TESTSIZE];

    for (int i = 0; i < TESTSIZE; i++) {
        arr[i] = rand();
    }

    for (int i = 0; i < TESTSIZE; i++) {
        cout << "Inserting: " << arr[i] << "\n";
        if (!qtest->enqueue(arr[i])) {
            cout << "Failed to append at index " << i << ".\n";
            exit(1);
        }
        if (qtest->size != i + 1) {
            cout << "Size is not correct at index " << i << ".\n";
            exit(1);
        }
    }

    for (int i = 0; i < TESTSIZE; i++) {
        int result = qtest->dequeue();

        cout << "Removed: " << result << "\n";

        if (result != arr[i]) {
            cout << "Failed to fetch the correct value from the list at index " << i << ".\n";
            exit(1);
        };
    }

    qtest->clear();

    cout << "Done testing queue! Yeehaw\n";

    cout << "Testing stack...\n";
    Stack *stest = new Stack();

    for (int i = 0; i < TESTSIZE; i++) {
        arr[i] = rand();
    }

    for (int i = 0; i < TESTSIZE; i++) {
        cout << "Inserting: " << arr[i] << "\n";
        if (!stest->insert(arr[i])) {
            cout << "Failed to append at index " << i << ".\n";
            exit(1);
        }
        if (stest->size != i + 1) {
            cout << "Size is not correct at index " << i << ".\n";
            exit(1);
        }
    }

    for (int i = 0; i < TESTSIZE; i++) {
        int result = stest->pop();

        cout << "Popped: " << result << "\n";

        if (result != arr[TESTSIZE - i - 1]) {
            cout << "Failed to fetch the correct value from the list at index " << i << ".\n";
            exit(1);
        };
    }

    // TODO: figure out why this fails...
    // stest->clear();

    delete[] arr;

    cout << "Done testing stack! Yeehaw\n";
}