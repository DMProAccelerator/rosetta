#include <iostream>
#include <cstdint>
#include <chrono>
#include <random>

using namespace std;
#include "platform.h"


#include "TestDRAM.hpp"
// Testing reading from DRAM, multiplying vectors, writing back
void Run_TestDRAM(WrapperRegDriver* platform) {
  TestDRAM t(platform);

  cout << "Signature: " << hex << t.get_signature() << dec << endl;

  // Random 0/1 generator
  unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
  std::mt19937_64 generator (seed);
  std::uniform_int_distribution<uint32_t> distribution(0, 1);
  
  uint32_t n;
  cout << "Enter array length: ";
  cin >> n;
  uint32_t nBytes = n * sizeof(uint32_t);

  // Populate arrays
  uint32_t vec0[n];
  uint32_t vec1[n];
  for (int i = 0; i < n; ++i)
    vec0[i] = distribution(generator);
  for (int i = 0; i < n; ++i)
    vec1[i] = distribution(generator);

  // Print them for debugging
  for (int i = 0; i < n; ++i)
    cout << vec0[i];
  cout << endl;
  for (int i = 0; i < n; ++i)
    cout << vec1[i];
  cout << endl;

  uint32_t expectedResult = 0;
  for (int i = 0; i < n; ++i)
    expectedResult += __builtin_popcount(vec0[i] & vec1[i]);

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
  t.set_start(0);
  t.set_start(1);

  // Wait until finished
  while(t.get_finished() != 1) {
    //t.set_start(0);
    //t.set_start(1);
  }

  platform->deallocAccelBuffer(dramBufferVec0);
  platform->deallocAccelBuffer(dramBufferVec1);
  //platform->deallocAccelBuffer(dramBufferResult);

  // Output to user
  AccelReg res = t.get_out();
  cout << "Computed result was " << res << ", expected result was " << expectedResult << endl;

  // Copy result into main memory
  //platform->copyBufferAccelToHost(dramBufferResult, &result, sizeof(uint32_t));

  t.set_start(0);
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
