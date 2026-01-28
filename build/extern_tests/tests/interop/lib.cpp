// tests/interop/lib.cpp
#include <cstdio>

// A simple C++ class with virtual methods
class CppCalculator {
public:
    // Virtual Method #0
    virtual int Add(int a, int b) {
        printf("[C++] Add(%d, %d) called\n", a, b);
        return a + b;
    }

    // Virtual Method #1
    virtual int Sub(int a, int b) {
        printf("[C++] Sub(%d, %d) called\n", a, b);
        return a - b;
    }
};

extern "C" {
    // Factory function to create the C++ object
    CppCalculator* CreateCalculator() {
        return new CppCalculator();
    }

    // Helper to cleanup
    void DestroyCalculator(CppCalculator* c) {
        delete c;
    }
}