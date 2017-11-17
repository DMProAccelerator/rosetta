#include "platform.h"
#include <unistd.h>
#include "TestUART.hpp"
#include <iostream>

void Run_TestUART(WrapperRegDriver* platform){
  TestUART t(platform);

  char c[5] = {"h", "e", "l", "l", "o"};
  for (int i = 0; i < 5; ++i) {
    t.set_data(c++);
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
