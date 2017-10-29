from _test import ffi, lib
import numpy as np

def matrix_t2nparray(mat):
    rows = mat.rows
    cols = mat.cols
    # bitdepth...?
    res = np.zeros(rows*cols)
    for i in range(rows*cols):
        res[i] = mat.M[i]
    return res

w = np.array(range(256))
a = np.array(range(256, 0, -1))

W = ffi.new("matrix_t *")
W.rows = 4
W.cols = 64
W.bit_depth = 2
# NOTE: This is a call to C's malloc function, so we have to manually free this memory
W_Mp = lib.malloc(ffi.sizeof('int64_t')*W.rows*W.cols)
W.M = ffi.cast('int64_t*', W_Mp)

for i, num in enumerate(w):
    W.M[i] = num

A = ffi.new("matrix_t *")
A.rows = 4
A.cols = 64
A.bit_depth = 2
A_Mp = lib.malloc(ffi.sizeof('int64_t')*A.rows*A.cols)
A.M = ffi.cast('int64_t*', A_Mp)

for i, num in enumerate(a):
    A.M[i] = num

res = lib.add(A, W)
n_res = matrix_t2nparray(res)
print(n_res)

w = np.reshape(w,(4, 64))
a = np.reshape(a, (4, 64))
corr = w+a
print(corr)

# Remember to free everything
lib.free(A_Mp)
lib.free(W_Mp)
lib.free(res)

