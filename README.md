# Atmel SAMD21G18A (ATSAMD21G18A) Microcontroller Projects
Clean templates based on CMake with VSCode debug configurations


### Compilation

```
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE='../CMake/cortex-m0plus.cmake'
make
```
