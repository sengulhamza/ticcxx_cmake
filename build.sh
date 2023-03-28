
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

prepare_platform() {
    mkdir build
    cd build && cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug -D "CMAKE_TOOLCHAIN_FILE=../CMake/GNU-ARM-Toolchain.cmake" ../
}

build_app() {
    if [ -d "build" ]; then
        cd build && make
        exit 1;
    else
        if [ -f "Makefile" ]; then
            make
            exit 1;
        fi
    fi
    echo "-- ${RED}build folder not exist or not a make project${NC}"
    exit 0;
}

if [ -d "build" ]; then
    echo "-- ${RED}build dir already exist! ${NC}"
    while getopts "fb" option; do
        case $option in
        f) 
            rm -r build
            echo "-- ${GREEN}old build dir deleted with force!${NC}"
            prepare_platform
            ;;
        b)
            echo "-- ${GREEN}building app with make${NC}"
            build_app
            ;;
        esac
    done
    exit
fi
prepare_platform