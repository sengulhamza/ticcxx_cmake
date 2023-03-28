cmake_minimum_required(VERSION 3.6)

# set search path for CMake modules
set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMake/Modules)
message("-- Cmake module path:  ${CMAKE_MODULE_PATH}")

cmake_policy(SET CMP0048 NEW)
set(application_name "uartecho")
project (${application_name} VERSION 0.1.1 LANGUAGES C CXX ASM)

# platform-specific configurations
include(CMake/platform.cmake)

# Configure Toolchain for CC13xx
set(SimpleLinkCC13X0SDK_PATH "/Users/meplis/ti/simplelink_cc13x0_sdk_4_20_02_07")
set(Xdctools_PATH "/Users/meplis/ti/xdctools_3_51_03_28_core")
set(LINKER_SCRIPT "${CMAKE_CURRENT_SOURCE_DIR}/tools/CC1310_LAUNCHXL_TIRTOS.lds")

# Find dependencies
find_package(SimpleLinkCC13X0SDK REQUIRED)
find_package(Xdctools REQUIRED)

# include OpenOCD module, but make it not required
find_package(Openocd)

add_subdirectory(src)
