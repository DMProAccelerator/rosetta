#include <iostream>
#include <cstdint>
#include <chrono>
#include <random>
#include <unistd.h>

using namespace std;
#include "platform.h"


#include "BinaryMatrixVectorMultiplier.hpp"
// Testing reading from DRAM, multiplying vectors, writing back
void Run_AccelTest(WrapperRegDriver* platform) {
  BinaryMatrixVectorMultiplier t(platform);

  //cout << "Signature: " << hex << t.get_signature() << dec << endl;

  // Random 0/1 generator
  unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
  std::mt19937_64 generator (seed);
  std::uniform_int_distribution<uint32_t> distribution(0, 1);

  int wordSize = 32; // Assume this to be the one used in the accelerator
  
  uint32_t r, c;
  cout << "Enter matrix dimensions (rows columns): ";
  cin >> r >> c;
  uint32_t resBytes =  r * sizeof(uint32_t);
  uint32_t vectorBytes = ((c + wordSize -1)/wordSize)*wordSize/ 8; // Round to an integer number of wordsizes, in bytes
  uint32_t matrixBytes = vectorBytes * r; // There will be stride
  uint32_t stride = vectorBytes;
  
  // Populate arrays
  uint8_t matrix[matrixBytes];
  uint8_t vector[vectorBytes];
  cout<<"Matrix: "<<endl;
  for(int i = 0; i < r; ++i){
    for(int j = 0; j < vectorBytes; j++){
      matrix[i*stride + j] = 0;
      for(int k = 0; k < 8 && 8*j + k < c; k++){
	matrix[i*stride + j] |= (distribution(generator) << k);
	cout<<((matrix[i*stride + j] & (1<<k))>>k);
      }
    }
    cout<<endl;
  }
  cout<<endl;

  cout<<"Vector: "<<endl;
  for (int i = 0; i < vectorBytes; ++i){
    vector[i] = 0;
    for(int j = 0; j < 8 && 8*i + j < c; j++){
      vector[i] |= (distribution(generator) << j);
      cout<<((vector[i] & (1<<j)) >> j);
    }
  }
  cout<<endl;

  uint32_t expectedResult[r];
  cout<<"Expected result: "<<endl;
  for (int i = 0; i < r; ++i){
    expectedResult[i] = 0;
    for(int j = 0; j < vectorBytes; j++){
      expectedResult[i] += __builtin_popcount(vector[j] & matrix[i*stride + j]);
    }
    cout<<expectedResult[i]<<endl;
  }

  // Allocate DRAM memory
  void * dramBufferVector = platform->allocAccelBuffer(vectorBytes);
  void * dramBufferMatrix = platform->allocAccelBuffer(matrixBytes);
  void * dramBufferResult = platform->allocAccelBuffer(sizeof(uint32_t) * r);
  
  // Copy vectors to DRAM
  platform->copyBufferHostToAccel(vector, dramBufferVector, vectorBytes);
  platform->copyBufferHostToAccel(matrix, dramBufferMatrix, matrixBytes);

  //Initialize 
  t.set_addrV((AccelDblReg) dramBufferVector);
  t.set_addrM((AccelDblReg) dramBufferMatrix);
  t.set_addrR((AccelDblReg) dramBufferResult);
  t.set_numRows(r);
  t.set_numCols(c);
  t.set_stride(stride*8);

  cout<<"Debug before start: "<< t.get_debug() <<endl;

  // Start
  t.set_start(1);

  usleep(1000000);
  cout<<"Debug after start: " << t.get_debug() <<endl;
  cout<<"Error: "<<t.get_error()<<endl;
  /*
  // Wait until finished
  while(t.get_finished() != 1);

  // Copy result into main memory
  AccelReg res = t.get_out();
  uint64_t *result = new uint64_t[n];
  platform->copyBufferAccelToHost(dramBufferResult, result, n * sizeof(uint64_t));

  t.set_start(0);

  platform->deallocAccelBuffer(dramBufferVec0);
  platform->deallocAccelBuffer(dramBufferVec1);
  platform->deallocAccelBuffer(dramBufferResult);

  // Output to user
  cout << "Computed result was " << res << ", expected result was " << expectedResult << endl;

  cout << "DRAM: ";
  for (int i = 0; i < n; ++i)
    cout << result[i] << " ";
  cout << endl;

  delete[] result;*/
}


/*
#include "StreamWriterSample.hpp"
void Run_StreamWriterSample(WrapperRegDriver* platform){
  StreamWriterSample t(platform);

  t.set_start(0);

  cout << "Signature: " << hex << t.get_signature() << dec << endl;

  void * dramBufferResult = platform->allocAccelBuffer(sizeof(uint32_t));
 
  t.set_addr((AccelDblReg) dramBufferResult);
  cout<<"Output was "<<t.get_output()<<endl;
  t.set_start(1);
  cout<<"Output was "<<t.get_output()<<endl; 
 
  while(t.get_finished() != 1) cout<<"Output is "<<t.get_output()<<endl;

  uint32_t result;
  
  platform->copyBufferAccelToHost(dramBufferResult, &result, sizeof(uint32_t));
  
  cout<<"Expected result : " << t.get_output() <<endl;

  cout<<"Result was "<< result << endl;

  platform->deallocAccelBuffer(dramBufferResult);
  t.set_start(0);
}
*/
int main()
{
  WrapperRegDriver * platform = initPlatform();

  //Run_TestRegOps(platform);
  //Run_DRAMExample(platform);
  //Run_StreamWriterSample(platform);
  Run_AccelTest(platform);

  deinitPlatform(platform);

  return 0;
}
