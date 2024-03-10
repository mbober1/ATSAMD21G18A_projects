cmake_minimum_required(VERSION 3.13)
project(blink
        LANGUAGES ASM C CXX
        VERSION 1.0
        DESCRIPTION "ATSAMD21G18A"
)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED True)

set(FILE_ELF ${CMAKE_PROJECT_NAME}.elf)
set(FILE_HEX ${CMAKE_PROJECT_NAME}.hex)

# Add linker script to link options
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T${PROJECT_SOURCE_DIR}/samd21g18a_flash.ld")

add_executable(${FILE_ELF}) # ${CMAKE_CURRENT_LIST_DIR}/startup_SAMD21.s)

add_subdirectory(src)

target_compile_options(${FILE_ELF}
    PRIVATE
        $<$<COMPILE_LANGUAGE:NOT ASM>:" -Wall -Wextra">
)

#####   POST BUILD  ############################################################
add_custom_command(TARGET ${FILE_ELF} POST_BUILD
                    COMMENT "Creating .hex file.."
                    COMMAND ${OBJCOPY} -O ihex ${FILE_ELF} ${FILE_HEX}
)

add_custom_command(TARGET ${FILE_ELF} POST_BUILD
                    COMMENT "Calculating size.."
                    COMMAND ${OBJSIZE} ${FILE_ELF}
)