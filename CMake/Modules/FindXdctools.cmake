##
## Author:   Johannes Bruder
## License:  See LICENSE.TXT file included in the project
##
##
## Find TI's xdctools
##

include(FindPackageHandleStandardArgs)

set(Xdctools_HEADER_DIR "${Xdctools_PATH}/packages/xdc")
list(APPEND CMAKE_PREFIX_PATH ${Xdctools_PATH})

# Find the path to xdc headers
message("-- Content of Xdctools_HEADER_DIR:" ${Xdctools_HEADER_DIR})

# Set according include path
set(Xdctools_INCLUDE_DIR "${Xdctools_HEADER_DIR}/../../packages")

message("-- Content of Xdctools_INCLUDE_DIR:" ${Xdctools_INCLUDE_DIR})

find_package_handle_standard_args(Xdctools DEFAULT_MSG
  Xdctools_INCLUDE_DIR)

set(Xdctools_INCLUDE_DIRS ${Xdctools_INCLUDE_DIR})
