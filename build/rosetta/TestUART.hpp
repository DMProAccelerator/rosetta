
  #ifndef TestUART_H
  #define TestUART_H
  #include "wrapperregdriver.h"
  #include <map>
  #include <string>
  #include <vector>

  using namespace std;
  class TestUART {
  public:
    TestUART(WrapperRegDriver * platform) {
      m_platform = platform;
      attach();
    }
    ~TestUART() {
      detach();
    }

      void set_btn(AccelReg value) {writeReg(1, value);} 
  void set_data(AccelReg value) {writeReg(2, value);} 
  AccelReg get_done() {return readReg(3);} 
  AccelReg get_led() {return readReg(4);} 
  AccelReg get_signature() {return readReg(0);} 
  void set_start(AccelReg value) {writeReg(5, value);} 
  void set_sw(AccelReg value) {writeReg(6, value);} 
  AccelReg get_tx() {return readReg(7);} 


    map<string, vector<unsigned int>> getStatusRegs() {
      map<string, vector<unsigned int>> ret = { {"done", {3}} ,  {"led", {4}} ,  {"signature", {0}} ,  {"tx", {7}} };
      return ret;
    }

    AccelReg readStatusReg(string regName) {
      map<string, vector<unsigned int>> statRegMap = getStatusRegs();
      if(statRegMap[regName].size() != 1) throw ">32 bit status regs are not yet supported from readStatusReg";
      return readReg(statRegMap[regName][0]);
    }

  protected:
    WrapperRegDriver * m_platform;
    AccelReg readReg(unsigned int i) {return m_platform->readReg(i);}
    void writeReg(unsigned int i, AccelReg v) {m_platform->writeReg(i,v);}
    void attach() {m_platform->attach("TestUART");}
    void detach() {m_platform->detach();}
  };
  #endif
      