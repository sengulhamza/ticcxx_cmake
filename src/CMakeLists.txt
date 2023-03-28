#
# Target
#

set(sources
    ${CMAKE_CURRENT_SOURCE_DIR}/core/startup.c
)

include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${SimpleLinkCC13X0SDK_INCLUDE_DIRS}
    ${Xdctools_INCLUDE_DIRS}
)

# set some project constants
set(elf_file ${application_name}.elf)
set(bin_file ${application_name}.bin)
set(hex_file ${application_name}.hex)
set(map_file ${application_name}.map)
set(lss_file ${application_name}.lss)

add_executable(${elf_file} ${sources})

# link libraries to project
target_link_libraries(${elf_file} PUBLIC app)

# set additional for compiler and linker: optimization and generate map file
set(additional_linker_flags -Wl,-Map=${map_file},--cref,--no-warn-mismatch)
target_link_libraries(${elf_file} PRIVATE ${additional_linker_flags})

# remove unused sections
target_link_libraries(${elf_file} PUBLIC "-g -Wl,--gc-sections")

# link with linker file
target_link_libraries(${elf_file} PUBLIC -T${LINKER_SCRIPT})

target_link_options(${elf_file} PRIVATE
  LINKER:--print-memory-usage
)

# show size of resulting firmware image
add_custom_target(${elf_file}-size DEPENDS ${elf_file} COMMAND ${ARM_SIZE_EXECUTABLE} -B ${elf_file})

# generate extended listing
add_custom_target(${lss_file} DEPENDS ${elf_file} COMMAND ${ARM_OBJDUMP_EXECUTABLE} -S ${elf_file} > ${lss_file})

# create binary and hex files
add_custom_target(${hex_file} DEPENDS ${elf_file} COMMAND ${ARM_OBJCOPY_EXECUTABLE} -Oihex ${elf_file} ${hex_file})
add_custom_target(${bin_file} DEPENDS ${elf_file} COMMAND ${ARM_OBJCOPY_EXECUTABLE} -Obinary ${elf_file} ${bin_file})
add_custom_target(${application_name} ALL DEPENDS ${elf_file}-size ${bin_file} ${hex_file} ${lss_file})

add_subdirectory(app)
