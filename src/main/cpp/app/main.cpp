#include <iostream>
#include <cstdint>
using namespace std;

#include "platform.h"

#include "TestVecVec.hpp"
void Run_TestVecVec(WrapperRegDriver* platform) {
  TestVecVec t(platform);
    
  cout << "Signature: " << hex << t.get_signature() << dec << endl;
  cout << "Enter A and B: ";
  uint32_t a, b;
  cin >> a >> b;

  t.set_reset(1);
  t.set_reset(0);
  t.set_vec_a(a);
  t.set_vec_b(b);
  t.set_write_enable(1);
  t.set_write_enable(0);

  cout << "Result: " << t.get_out() << endl;

} 

/*
#include "TestRegOps.hpp"
bool Run_TestRegOps(WrapperRegDriver * platform) {
  TestRegOps t(platform);

  cout << "Signature: " << hex << t.get_signature() << dec << endl;
  cout << "Enter two operands to sum: ";
  unsigned int a, b;
  cin >> a >> b;

  t.set_op_0(a);
  t.set_op_1(b);

  cout << "Result: " << t.get_sum() << " expected: " << a+b << endl;

  return (a+b) == t.get_sum();
}
*/

int main()
{
  WrapperRegDriver * platform = initPlatform();

  //Run_TestRegOps(platform);
  Run_TestVecVec(platform);

  deinitPlatform(platform);

  return 0;
}
