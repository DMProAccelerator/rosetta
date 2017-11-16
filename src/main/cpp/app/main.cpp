#include "platform.h"
#include <unistd.h>
#include "TestUART.hpp"
#include <iostream>
#include <vector>

void Run_TestUART(WrapperRegDriver* platform){
  TestUART t(platform);

  std::vector<char> chars = { 'h', 'e', 'l', 'l', 'o' };
  for (char c : chars) {
    t.set_data(c);
    t.set_start(1);
    while(t.get_done() != 1);
    t.set_start(0);
  }

}

int main(){
  WrapperRegDriver * platform = initPlatform();

  Run_TestUART(platform);

  deinitPlatform(platform);
  return 0;
}

