# 1. Compile C++ Library -> lib.o
# -fno-rtti: Keeps vtables simple (index 0 start)
g++ -c tests/interop/lib.cpp -o tests/interop/lib.o -fno-rtti -fPIC

# 2. Compile Arc Source -> main.o
../arc build tests/interop/main.arc -o tests/interop/main.o

# 3. Link them together -> main_extern
# We use g++ to link so standard C++ libraries are included
g++ tests/interop/main.o tests/interop/lib.o -o tests/interop/main_extern -no-pie

# 4. Run it
./tests/interop/main_extern