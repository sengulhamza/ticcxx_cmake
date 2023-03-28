set(sources
    src/main_tirtos.c
    src/CC1310_LAUNCHXL.c
    src/uartecho.c
)

add_library(app ${sources})

set_source_files_properties(
    ${sources}
    PROPERTIES COMPILE_FLAGS
    "-pedantic -Werror -Wextra"
)

target_link_libraries(app PUBLIC
    ${SimpleLinkCC13X0SDK_drivers_cc13x0_LIBRARY}
    ${SimpleLinkCC13X0SDK_rf_multiMode_cc13x0_LIBRARY}
    ${SimpleLinkCC13X0SDK_dpl_cc13x0_LIBRARY}
    ${SimpleLinkCC13X0SDK_driverlib_LIBRARY}
)

target_include_directories(app PUBLIC inc)
target_include_directories(app PRIVATE inc/app)

target_compile_definitions(app PUBLIC -DDeviceFamily_CC13X0)
