#include "platform.h"
#include "UART.hpp"
#include <iostream>

void Run_UART(WrapperRegDriver* platform){
  UART t(platform);
  /* t.set_inputnavn();
   * t.get_outputnavn();
   * */
  t.set_data(0xAA);
  t.set_valid(1); 
  t.set_valid(0);
}

int main(){
  WrapperRegDriver * platform = initPlatform();
  
  Run_UART(platform);
  deinitPlatform(platform);
  return 0;


}
