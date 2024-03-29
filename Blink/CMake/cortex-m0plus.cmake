set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(MCPU_FLAGS "-mthumb -mcpu=cortex-m0plus")
set(VFP_FLAGS "-mfloat-abi=soft")
set(LD_FLAGS "")

include(${CMAKE_CURRENT_LIST_DIR}/arm-none-eabi.cmake)