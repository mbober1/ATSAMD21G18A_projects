cmake_minimum_required(VERSION 3.13)

target_sources(${FILE_ELF}
    PUBLIC
        ${CMAKE_CURRENT_LIST_DIR}/main.cpp
        ${CMAKE_CURRENT_LIST_DIR}/syscalls.c
        ${CMAKE_CURRENT_LIST_DIR}/system_samd21.c
        ${CMAKE_CURRENT_LIST_DIR}/startup_samd21.c
)

target_include_directories(${FILE_ELF}
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
        ${PROJECT_SOURCE_DIR}/CMSIS/Include
        ${PROJECT_SOURCE_DIR}/CMSIS/Device/Atmel/ATSAMD21G18A
)

target_compile_definitions(${FILE_ELF}
    PUBLIC
        "__SAMD21J18A__"
)