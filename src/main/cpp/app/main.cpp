#include <iostream>
#include <cstdint>
using namespace std;

#include "platform.h"

#include "TestDRAM.hpp"
// Testing reading from DRAM, multiplying vectors, writing back
void Run_TestDRAM(WrapperRegDriver* platform) {
  TestDRAM t(platform);
    
  cout << "Signature: " << hex << t.get_signature() << dec << endl;

  // Get input
  cout << "Enter A and B: ";
  uint32_t a, b;
  cin >> a >> b;

  // Number of bytes representing vectors
  int nBytes = 4; 

  // Input vectors, rounded to contain all input
  uint32_t vec0[(nBytes + sizeof(uint32_t) - 1)/sizeof(uint32_t)];
  uint32_t vec1[(nBytes + sizeof(uint32_t) - 1)/sizeof(uint32_t)];
  //uint32_t result;

  // Set vectors
  vec0[0] = a;
  vec1[0] = b;

  // Allocate DRAM memory
  void * dramBufferVec0 = platform->allocAccelBuffer(nBytes);
  void * dramBufferVec1 = platform->allocAccelBuffer(nBytes);
  //void * dramBufferResult = platform->allocAccelBuffer(sizeof(uint32_t));
  
  // Copy vectors to DRAM
  platform->copyBufferHostToAccel(vec0, dramBufferVec0, nBytes);
  platform->copyBufferHostToAccel(vec1, dramBufferVec1, nBytes);

  //Initialize 
  t.set_addrA((AccelDblReg) dramBufferVec0);
  t.set_addrB((AccelDblReg) dramBufferVec1);
  //t.set_addrR((AccelDblReg) dramBufferResult);
  t.set_byteCount(nBytes);
  
  // Start
  t.set_start(0); // must begin off to let the statemachines go to idle
  t.set_start(1);

  // Compute expected result, poor man's popcount
  uint32_t expectedResult = 0;
  uint32_t binaryProduct = a & b;
  for(int i = 0; i < 8*sizeof(uint32_t); i++){
    expectedResult += ((1 << i) & binaryProduct) != 0;
  }
  
  // Wait until finished
  while(t.get_finished() != 1);
  
  // Output to user
  AccelReg res = t.get_out();
  cout << "Computed result was " << res << ", expected result was " << expectedResult << endl;

  t.set_start(0);

  // Copy result into main memory
  //platform->copyBufferAccelToHost(dramBufferResult, &result, sizeof(uint32_t));

  platform->deallocAccelBuffer(dramBufferVec0);
  platform->deallocAccelBuffer(dramBufferVec1);
  //platform->deallocAccelBuffer(dramBufferResult);

} 

int main()
{
  WrapperRegDriver * platform = initPlatform();

  //Run_TestRegOps(platform);
  //Run_DRAMExample(platform);
  Run_TestDRAM(platform);

  deinitPlatform(platform);

  return 0;
}
