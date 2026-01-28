#include <cstdio>

namespace Math {
    // 1. Simple Function
    int Add(int a, int b) {
        printf("[C++] Math::Add(%d, %d)\n", a, b);
        return a + b;
    }

    // 2. Overloading (float)
    float Add(float a, float b) {
        printf("[C++] Math::Add(%f, %f)\n", a, b);
        return a + b;
    }

    class Vector3 {
    public:
        float x, y, z;

        // 3. Constructor
        Vector3(float _x, float _y, float _z) : x(_x), y(_y), z(_z) {}

        // 4. Non-virtual Method (Declaration only)
        float Length();

        // 5. Static Method
        static Vector3 Zero() {
            printf("[C++] Vector3::Zero()\n");
            return Vector3(0, 0, 0);
        }
    };

    // Definition: Moving this outside ensures the symbol _ZN4Math7Vector36LengthEv is generated
    float Vector3::Length() {
        printf("[C++] Vector3::Length()\n");
        // Simple squared length for this test
        return x*x + y*y + z*z;
    }
}

extern "C" {
    // Factory for Arc
    Math::Vector3* CreateVector(float x, float y, float z) {
        return new Math::Vector3(x, y, z);
    }
}