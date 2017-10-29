from cffi import FFI

ffibuilder = FFI()

ffibuilder.cdef("""

typedef struct {
    int64_t *M;
    int rows, cols, bit_depth;
    ...;
} matrix_t;

// declare malloc and free for full control over memory
// these can be used in a python program now
void* malloc(size_t size);
void free(void* p);

// Just an example function
matrix_t* add(matrix_t* A, matrix_t* B);
""")

ffibuilder.set_source("_test", 
r"""
#include "bitserial.h"
#include "run_test.hpp"
#include "TestBMVM.hpp"
#include "platform.h"

""",
sources = ['run_test.cpp', 'bitserial.cpp', 'platform-xlnk.cpp'], # add all sources here
libraries=['sds_lib'],  # add all libraries that must be linked here
extra_compile_args=['-std=c++11'], # extra compile args
source_extension='.cpp')  # because we're using c++


# This creates .py, .c, and .so files, so that functionality declared in this file can be compiled elsewhere
if __name__ == "__main__":
    ffibuilder.compile(verbose=True)
